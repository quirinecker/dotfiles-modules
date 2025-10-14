local M = {}

M.colors = {
	blue        = '#80a0ff',
	cyan        = '#79dac8',
	transparent = nil,
	white       = '#c6c6c6',
	red         = '#ff5189',
	violet      = '#d183e8',
	grey        = '#303030',
}

M.theme = {
	normal = {
		a = { fg = M.colors.transparent, bg = M.colors.violet },
		b = { fg = M.colors.white, bg = M.colors.grey },
		c = { fg = M.colors.transparent, bg = M.colors.transparent },
	},

	insert = { a = { fg = M.colors.transparent, bg = M.colors.blue } },
	visual = { a = { fg = M.colors.transparent, bg = M.colors.cyan } },
	replace = { a = { fg = M.colors.transparent, bg = M.colors.red } },

	inactive = {
		a = { fg = M.colors.white, bg = M.colors.transparent },
		b = { fg = M.colors.white, bg = M.colors.transparent },
		c = { fg = M.colors.transparent, bg = M.colors.transparent },
	},
}

return M
