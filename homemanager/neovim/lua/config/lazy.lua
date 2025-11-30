-- require('lazy').setup("plugins")
require('lazy').setup({
	ui = {
		border = "rounded"
	},
	spec = {
		{ import = "plugins.spec" },
	}
})
