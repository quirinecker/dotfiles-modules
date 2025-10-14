return {
	cmd = { "vscode-json-language-server", "--stdio" },
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { 'package.json' },
					url = 'https://json.schemastore.org/package.json',
				},
				{
					fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
					url = 'https://json.schemastore.org/tsconfig.json'
				}
			},
		},
	}
}
