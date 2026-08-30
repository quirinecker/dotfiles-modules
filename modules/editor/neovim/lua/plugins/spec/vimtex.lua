function preview()
	if vim.bo.filetype ~= "tex" then
		return
	end

	print("Previewing " .. vim.fn.expand("%:p"))

	vim.cmd("VimtexCompile")
end

return {
	'lervag/vimtex',
	-- event = "InsertEnter",
	config = function()
		vim.g.vimtex_view_method = "zathura"
		vim.keymap.set("n", "<leader>p", preview)
	end,
	lazy = false,
	enabled = true,
	dependencies = {}
}
