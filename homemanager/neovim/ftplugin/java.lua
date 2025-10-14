local function setup()
	local from_home = '/.cache/nvim-lsp/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls'
	local home_dir = os.getenv('HOME')
	local path = home_dir .. from_home


	local config = {
		cmd = { path },
		root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
		settings = {
			java = {
				configuration = {
					runtimes = {
						{
							name = "JavaSE-1.8",
							path = "/home/quirinecker/.sdkman/candidates/java/8.0.302-open"
						},
						{
							name = "JavaSE-11",
							path = "/home/quirinecker/.sdkman/candidates/java/11.0.2-open"
						},
						{
							name = "JavaSE-17",
							path = "/home/quirinecker/.sdkman/candidates/java/17-open"
						},
						{
							name = "JavaSE-18",
							path = "/home/quirinecker/.sdkman/candidates/java/18-open"
						}
					}
				}
			}
		}
	}

	require('jdtls').start_or_attach(config)

	vim.cmd [[
		command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
		command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
		command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
		command! -buffer JdtJol lua require('jdtls').jol()
		command! -buffer JdtBytecode lua require('jdtls').javap()
		command! -buffer JdtJshell lua require('jdtls').jshell()
	]]
end
