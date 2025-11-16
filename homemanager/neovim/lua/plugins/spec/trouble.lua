return {
	"folke/trouble.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	enabled = false,
	config = function()
		require("trouble").setup {}
	end,
	init = function()
		vim.api.nvim_create_autocmd("BufRead", {
			callback = function(ev)
				if vim.bo[ev.buf].buftype == "quickfix" then
					vim.schedule(function()
						vim.cmd([[cclose]])
						vim.cmd([[Trouble qflist open]])
					end)
				end
			end,
		})
	end,
	cmd = { "Trouble" },
	keys = {
		{ "<leader>dl", vim.diagnostic.setqflist, "(d)iagnostic (l)ist" },
		{ "<leader>qn", vim.cmd.cnext,            "(q)uickfix (n)ext" },
		{ "<leader>qp", vim.cmd.cprev,            "(q)uickfix (p)revious" },
	}
}
