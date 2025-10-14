return {
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	lazy = false,
	config = function()
		require('plugins.config.lualine')
	end,
	dependencies = {
		require("plugins.spec.theme")
	}
}
