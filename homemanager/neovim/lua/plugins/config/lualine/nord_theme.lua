local M = {}

M.colors = {
	nord1       = '#3B4252',
	nord3       = '#4C566A',
	nord5       = '#E5E9F0',
	nord6       = '#ECEFF4',
	nord7       = '#8FBCBB',
	nord8       = '#88C0D0',
	nord13      = '#EBCB8B',
	transparent = nil,
}

M.spec = {
	normal = {
		a = { fg = M.colors.transparent, bg = M.colors.nord8, gui = 'bold' },
		b = { fg = M.colors.nord5, bg = M.colors.nord1 },
		c = { fg = M.colors.transparent, bg = M.colors.transparent },
	},
	insert = { a = { fg = M.colors.transparent, bg = M.colors.nord6, gui = 'bold' } },
	visual = { a = { fg = M.colors.transparent, bg = M.colors.nord7, gui = 'bold' } },
	replace = { a = { fg = M.colors.transparent, bg = M.colors.nord13, gui = 'bold' } },
	inactive = {
		a = { fg = M.colors.nord1, bg = M.colors.transparent, gui = 'bold' },
		b = { fg = M.colors.nord5, bg = M.colors.transparent },
		c = { fg = M.colors.transparent, bg = M.colors.transparent },
	},
}

return M
