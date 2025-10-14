return {
	"tpope/vim-dadbod",
	config = function()
		local augroup = vim.api.nvim_create_augroup("SqlCompletion", {})

		vim.api.nvim_create_autocmd({ "FileType" }, {
			group = augroup,
			pattern = { "sql", "mysql", "plsql" },
			callback = function()
				require('cmp').setup.buffer({
					sources = {
						{ name = 'vim-dadbod-completion' }
					}
				})
			end
		})
	end,
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"pbogut/vim-dadbod-ssh",
		"kristijanhusak/vim-dadbod-completion"
	}
}
