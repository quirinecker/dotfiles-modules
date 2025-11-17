local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local devicons = require("nvim-web-devicons")

local branch = vim.fn.system("git branch --show-current 2>/dev/null")
branch = branch:gsub("\n", "")


local mode_names = {
	n         = "NORMAL",
	no        = "OP-PENDING",
	nov       = "OP-PENDING",
	noV       = "OP-PENDING",
	["no\22"] = "OP-PENDING",

	niI       = "NORMAL",
	niR       = "NORMAL",
	niV       = "NORMAL",

	v         = "VISUAL",
	V         = "V-LINE",
	["\22"]   = "V-BLOCK", -- CTRL-V

	s         = "SELECT",
	S         = "S-LINE",
	["\19"]   = "S-BLOCK", -- CTRL-S

	i         = "INSERT",
	ic        = "INSERT",
	ix        = "INSERT",

	R         = "REPLACE",
	Rc        = "REPLACE",
	Rx        = "REPLACE",
	Rv        = "V-REPLACE",
	Rvc       = "V-REPLACE",
	Rvx       = "V-REPLACE",

	c         = "COMMAND",
	cv        = "EX",
	ce        = "EX",

	r         = "ENTER",
	rm        = "MORE",
	["r?"]    = "CONFIRM",

	["!"]     = "SHELL",
	t         = "TERMINAL",
}


local colors = {
	bg        = "#3B4252", -- Polar Night
	fg        = "#ECEFF4", -- Snow Storm
	red       = "#BF616A", -- Aurora
	orange    = "#D08770",
	yellow    = "#EBCB8B",
	green     = "#A3BE8C",
	cyan      = "#88C0D0",
	blue      = "#81A1C1",
	blue_dark = "#5E81AC",
	magenta   = "#B48EAD",
}

local mode_colors = {
	n       = colors.blue_dark, -- NORMAL
	i       = colors.green,  -- INSERT
	v       = colors.magenta, -- VISUAL
	V       = colors.magenta,
	["\22"] = colors.magenta, -- V-BLOCK

	c       = colors.yellow, -- COMMAND
	s       = colors.orange, -- SELECT
	S       = colors.orange,
	R       = colors.red,    -- REPLACE
	r       = colors.red,

	t       = colors.cyan, -- TERMINAL
}

local function BorderLeft(color, background)
	return {
		provider = "",
		hl = function()
			return { fg = color, bg = background }
		end,
	}
end

local function BorderRight(color, background)
	return {
		provider = "",
		hl = function()
			return { fg = color, bg = background }
		end,
	}
end

local function Mode(color)
	return {
		provider = function()
			return " " .. mode_names[vim.fn.mode()] .. " "
		end,
		hl = function()
			return { bg = color, fg = colors.fg, bold = true }
		end,
	}
end

local FileName = {
	provider = function()
		local name = vim.fn.expand("%:t")
		if name == "" then name = "[No Name]" end
		return name
	end,
	hl = { fg = colors.fg, bg = colors.bg },
}

local GitBranch = {
	-- condition = function(self)
	--     return vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == "true\n"
	-- end,

	provider = function(self)
		return " " .. branch .. " "
	end,

	hl = { fg = colors.blue, bg = colors.bg },
}



local FileIcon = {
	init = function(self)
		self.filename = vim.fn.expand("%:t")
		self.extension = vim.fn.expand("%:e")
		self.icon, self.icon_color = devicons.get_icon_color(self.filename, self.extension, { default = true })
	end,

	provider = function(self)
		return " " .. self.icon .. " "
	end,

	hl = function(self)
		return { fg = self.icon_color, bg = colors.bg }
	end,
}

function SimpleSeperator(foreground, background)
	return {
		provider = function()
			return " | "
		end,
		hl = function()
			return { fg = foreground, bg = background }
		end,
	}
end

-- local Lsp = {
-- 	condition = function()
-- 		return #vim.lsp.get_active_clients({ bufnr = 0 }) > 0
-- 	end,
-- 	provider = "   LSP ",
-- 	hl = { fg = colors.green },
-- }
--

local function Diagnostics(background)
	return {
		condition = function()
			return vim.diagnostic.is_enabled()
		end,

		init = function(self)
			self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
			self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
			self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		end,

		{
			-- condition = function(self) return self.errors > 0 end,
			provider = function(self) return " " .. self.errors .. " " end,
			hl = { fg = colors.red, bg = background },
		},
		{
			-- condition = function(self) return self.warnings > 0 end,
			provider = function(self) return " " .. self.warnings .. " " end,
			hl = { fg = colors.yellow, bg = background },
		},
		{
			-- condition = function(self) return self.info > 0 end,
			provider = function(self) return " " .. self.info .. " " end,
			hl = { fg = colors.blue, bg = background },
		},
		{
			-- condition = function(self) return self.hints > 0 end,
			provider = function(self) return " " .. self.hints .. " " end,
			hl = { fg = colors.cyan, bg = background },
		},
	}
end

local FileType = {
	provider = function()
		return " " .. vim.bo.filetype .. " "
	end,
	hl = { fg = colors.fg, bg = colors.bg },
}

local function FilePercentage(background)
	return {
		provider = function()
			local current = vim.fn.line(".") -- current line
			local total = vim.fn.line("$") -- total lines
			if total == 0 then return "Top" end
			local percent = math.floor((current / total) * 100)
			return percent .. "%%"
		end,
		hl = { fg = colors.fg, bg = background, bold = true },
	}
end

local DefaultStatusline = {
	BorderLeft(colors.blue),
	Mode(colors.blue),
	BorderRight(colors.blue, colors.bg),
	FileIcon,
	FileName,
	SimpleSeperator(colors.fg, colors.bg),
	GitBranch,
	BorderRight(colors.bg),
	{ provider = "%=" },

	BorderLeft(colors.bg),
	FileIcon,
	FileType,
	SimpleSeperator(colors.fg, colors.bg),
	Diagnostics(colors.bg),
	BorderLeft(colors.blue, colors.bg),
	FilePercentage(colors.blue),
	BorderRight(colors.blue),
}

require("heirline").setup({ statusline = DefaultStatusline })
