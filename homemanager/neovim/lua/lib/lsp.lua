M = {}

function M.has_file(filename)
	return vim.fn.filereadable(filename) == 1
end

return M
