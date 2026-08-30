return {
	config = function()
		local vuePluginPath = vim.fn.expand(
			"~/.config/dotfiles/homes/quirinecker/.npm_global/node_modules/@vue/typescript-plugin/")

		return {
			cmd = { "typescript-language-server", "--stdio" },
			single_file_support = true,
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vuePluginPath,
						languages = { "javascript", "typescript", "vue" },
					},
				},
			},
			filetypes = {
				"javascript",
				"typescript",
				-- currently disabled because no attribute completions
				-- "vue",
			}
		}
	end
}

