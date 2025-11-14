return {
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	lazy = false,
	config = function()
		local lualineConfig = require('plugins.config.lualine')

		-- loading lualine delayed again because of transparency issues
		vim.defer_fn(function()
			lualineConfig.setup()
		end, 100)
	end,
	dependencies = {
		require("plugins.spec.theme"),

		{
			"christopher-francisco/tmux-status.nvim",
			lazy = true,
			opts = {},
		},
	}
}
