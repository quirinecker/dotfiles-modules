require("witch-line").setup({
	abstracts = {
		"file.name",
		{
			id = "file",                                    -- Abstract component for file-related info
			padding = { left = 1, right = 1 },              -- Padding around the component
			static = { some_key = "some_value" },           -- Static metadata
			style = { fg = "#ffffff", bg = "#000000", bold = true }, -- Style override
			min_screen_width = 80,                          -- Hide if screen width < 80
		},
	},

	statusline = {
		--- The global statusline components
		global = {
			"mode",
			"file.name",
			"git.branch",
			-- {
			-- 	id = "component_id",                         -- Unique identifier
			-- 	padding = { left = 1, right = 1 },           -- Padding around the component
			-- 	static = { some_key = "some_value" },        -- Static metadata
			-- 	win_individual = false,
			-- 	timing = false,                              -- No timing updates
			-- 	style = { fg = "#ffffff", bg = "#000000", bold = true }, -- Style override
			-- 	min_screen_width = 80,                       -- Hide if screen width < 80
			-- 	hidden = function()                          -- Hide condition
			-- 		return vim.bo.buftype == "nofile"
			-- 	end,
			-- 	left_style = { fg = "#ff0000" },     -- Left style override
			-- 	update = function(self, ctx, static, session_id) -- Main content generator
			-- 		return vim.fn.expand("%:t")
			-- 	end,
			-- 	ref = { -- References to other components
			-- 		events = { "file.name" },
			-- 		style = "file.name",
			-- 		static = "file.name",
			-- 	},
			-- },
		},

		-- @type fun(winid): CombinedComponent[]|nil
		win = nil
	},

	cache = {
		-- Perform full plugin scan for cache expiration. Default false.
		full_scan = false,
		-- Show notification when cache is cleared. Default true.
		notification = true,
		-- Strip debug info when caching dumped functions. Default false.
		func_strip = false,
	},

	disabled = {
		filetypes = { "help", "TelescopePrompt" },
		buftypes = { "nofile", "terminal" },
	},
})
