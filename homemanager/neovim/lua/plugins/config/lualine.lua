local M = {}

local function CurrentTime()
	return os.date("%H:%M:%S")
end

local theme = require('plugins.config.lualine.nord_theme')

local opts = {
	options = {
		theme = theme.spec,
		component_separators = '|',
		section_separators = { left = ' ', right = ' ' },
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = ' ', right = '' } },
		},
		lualine_b = { {
			'tabs',
			seperator = " ",
			cond = function()
				return #vim.fn.gettabinfo() >= 2
			end,
			tabs_color = {
				inactive = { fg = theme.colors.nord5 },
				active = { fg = theme.colors.nord8 },
			}
		}, 'filename', 'branch', 'diff' },
		lualine_c = {
		},
		lualine_x = {},
		lualine_y = { 'filetype', { 'diagnostics', always_visible = true }, 'progress' },
		lualine_z = {
			{ CurrentTime, separator = { right = ' ', left = '' } },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = {},
}


M.setup = function()
	require('lualine').setup(opts)
end

M.setup()

return M
