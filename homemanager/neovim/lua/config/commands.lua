local lib = require('lib.window')

local command = function(name, callback)
	vim.api.nvim_create_user_command(name, callback, {})
end

command('Settings', function()
	local path = vim.fn.expand('~/.config/dotfiles/homes/quirinecker/.config/nvim')
	lib.new_window(path, 'Settings')
end)

command('TransparencyFix', function()
	require('lualine').setup(require('plugins.lualine').opts)
end)

command('MavenStartCommand', function()
	local Path = require("plenary.path")
	local cwd = Path:new(vim.fn.getcwd()):absolute()
	local baseName = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")

	if vim.fn.filereadable(cwd .. "/pom.xml") ~= 1 then
		vim.notify("No pom.xml found in current directory", vim.log.levels.ERROR)
		return
	end

	if not baseName:match(".java$") then
		vim.notify("Current buffer is not a java file", vim.log.levels.ERROR)
		return
	end

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	local className = baseName:gsub(".java", "")
	local packageName = ""
	for _, line in ipairs(lines) do
		if line:match("^package ") then
			local value = vim.split(line, " ")[2]
			packageName = value:gsub(";", "")
		end
	end

	vim.fn.setreg("+", "mvn exec:java -Dexec.mainClass=" .. packageName .. "." .. className)
	vim.notify("Copied Start Command to Clipboard", vim.log.levels.INFO)
end)
