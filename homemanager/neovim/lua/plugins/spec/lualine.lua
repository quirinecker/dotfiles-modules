return {
	'nvim-lualine/lualine.nvim',
	lazy = false,
	enabled = false,
	config = function()
		local lualineConfig = require('plugins.config.lualine')

		-- loading lualine delayed again because of transparency issues
		vim.defer_fn(function()
			lualineConfig.setup()
			if os.getenv("TMUX") then
				vim.o.laststatus = 3
			end
		end, 100)
	end,
	dependencies = {
		require("plugins.spec.theme"),
	}
}
