return {
	"sontungexpt/witch-line",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false, -- Almost component is lazy load by default. So you can set lazy to false
	enabled = false,
	config = function()
		vim.o.laststatus = 3
		require("plugins.config.witchline")
	end,
}
