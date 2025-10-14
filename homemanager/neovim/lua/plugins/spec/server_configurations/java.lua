return {
	cmd = { "jdtls", "-configuration", "/home/quirinecker/.cache/jdtls/config", "-data", "/home/quirinecker/.cache/jdtls/workspace" },
	java = {
		contentProvider = { preferred = 'fernflower' },
		configuration = {
			updateBuildConfiguration = 'interactive',
		},
	},
	{
		jvm_args = {},
		workspace = "/home/quirinecker/.cache/jdtls/workspace"
	},
	init_options = {
		jvm_args = {
			"--enable-preview"
		}
	}
}
