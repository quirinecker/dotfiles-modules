return {
	config = function()
		local vuePluginPath = vim.fn.expand(
			"~/.config/dotfiles/homes/quirinecker/.npm_global/node_modules/@vue/typescript-plugin/")
		local vue_plugin = {
			name = '@vue/typescript-plugin',
			location = vuePluginPath,
			languages = { 'vue' },
			configNamespace = 'typescript',
		}

		return {
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = {
							vue_plugin,
						},
					},
				},
			},
			filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		}
	end
}
