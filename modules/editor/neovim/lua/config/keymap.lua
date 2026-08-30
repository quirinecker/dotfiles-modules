local keymap = vim.keymap.set
keymap({ 'v', 'n' }, ' ', '', {})

local function vn_map(map, action)
	keymap({ 'v', 'n' }, map, action)
end

-- splitting


-- Clipboard
vn_map('<leader>y', [["+y]])
keymap('n', '<leader>yy', [["+yy]])
vn_map('<leader>op', [[o<Esc>"+p]])
vn_map('<leader>p', [["+p]])

vn_map('<leader>cl', ':bd <cr>')
vn_map('<leader>ss', ':w <cr>')
vn_map('<leader>sq', ':wq <cr>')
vn_map('<leader>sc', ':w <cr> :bd <cr>')

-- Quickfix List

vim.keymap.set('n', '<alt>n', ':cnext<cr>')
vim.keymap.set('n', '<alt>p', ':cprevious<cr>')

-- Terminal
vim.keymap.set('n', '<leader>tt', function()
	os.execute("kitty")
end)

-- Copy Path to clipboard
vim.keymap.set('n', '<leader>yrp', function()
	local path = vim.fn.expand("%:p")
	local relative_path = vim.fn.fnamemodify(path, ":~:.")
	vim.fn.setreg("+", relative_path)
	vim.notify('Copied "' .. relative_path .. '" to the clipboard!')
end)

vim.keymap.set('n', '<leader>yap', function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end)
