function preview()
	if vim.bo.filetype ~= "markdown" then
		return nil
	end

	vim.cmd("MarkdownPreview")
end

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	keys = {
		{ "<leader>p", preview, desc = "Markdown Preview" },
	},
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
