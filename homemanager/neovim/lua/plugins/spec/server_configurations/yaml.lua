return {
	cmd = { "yaml-language-server", "--stdio" },
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
				"compose.yaml",
				["https://raw.githubusercontent.com/SchemaStore/schemastore/refs/heads/master/src/schemas/json/github-workflow.json"] = "**/.github/workflows/*"

			}
		}
	}
}

