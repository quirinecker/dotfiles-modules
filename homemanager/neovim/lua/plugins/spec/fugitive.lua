return {
	'tpope/vim-fugitive',
	keys = {
		{ '<leader>gg', ':Git<cr>', 'Git Status' },
		{ '<leader>gc', function()
			if vim.bo.filetype == 'fugitive' then
				vim.cmd.close()
			end
			vim.cmd("Git commit")
		end, '(g)it (c)ommit' }
	},
	cmd = {
		'Git',
		'Gread',
		'Gbrowse'
	}
}
