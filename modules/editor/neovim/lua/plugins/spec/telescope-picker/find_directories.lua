local M = {}

M.find_directories = function()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values

	pickers.new({}, {
		prompt_title = "Finde Directories",
		__locations_input = true,
		finder = finders.new_oneshot_job({ "find", "-type", "d" }, {
			entry_maker = function(entry)
				return {
					value = entry,
					display = ' ' .. entry,
					ordinal = entry,
				}
			end
		}),
		sorter = conf.file_sorter()
	}):find()
end

return M
