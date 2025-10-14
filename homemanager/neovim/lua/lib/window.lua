return {
	new_window = function(o_path, o_title)
		if o_path == nil then
			o_path = vim.fn.getcwd()
		end

		if o_title == nil then
			o_title = "neovim"
		end

		print(string.format("ghostty --working-directory='%s' --title='%s' -e nvim .", o_path, o_title))
		return vim.fn.jobstart(string.format("ghostty --working-directory='%s' --title='%s' -e nvim .", o_path, o_title),
			{ detach = true })
	end
}
