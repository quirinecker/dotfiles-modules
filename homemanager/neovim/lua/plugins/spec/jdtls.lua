return {
	enabled = false,
	"mfussenegger/nvim-jdtls",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("jdtls").start_or_attach({
			cmd = { "jdtls" },
			root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
			capabilities = capabilities
		})
	end,
	dependencies = {
		require("plugins.spec.lsp")
	}
}
