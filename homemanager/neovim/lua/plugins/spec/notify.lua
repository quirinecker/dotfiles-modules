return {
	'rcarriga/nvim-notify',
	event = "UIEnter",
	lazy = false,
	config = function()
		require('notify').setup {
			background_colour = "#000000",
		}

		vim.notify = require('notify')
	end
}
