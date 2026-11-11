local function list_dailies()
	vim.cmd("ObsidianDailies -5 2")
end

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		require('plugins.spec.treesitter')

		-- see below for full list of optional dependencies 👇
	},
	config = function()
		vim.opt_global.conceallevel = 2

		require("plugins.config.obsidian")

		require("obsidian").setup({

			workspaces = {
				{
					name = "Personal",
					path = "~/Nextcloud/obsidian/Personal",
				},
			},

			daily_notes = {
				folder = "daily/"
			}

			-- see below for full list of options 👇
		})
	end,
	keys = {
		{ '<leader>ld', list_dailies, desc = "(l)ist (d)ailies" }

	}
}
