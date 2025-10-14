local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

local function trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

local function parse_emoji_line(line)
	if not line or vim.startswith(line, "#") then
		return nil
	end

	local id_element_split = vim.split(line, ";")
	local element = id_element_split[2]

	if not element then
		return nil
	end

	local state_emoji_split = vim.split(element, "#")
	local qualified = state_emoji_split[1]
	local emoji = state_emoji_split[2]

	if not qualified or trim(qualified) ~= "fully-qualified" then
		return nil
	end

	if not emoji then
		return nil
	end

	local icon_description_split = vim.split(emoji, " ")
	local icon = icon_description_split[2]
	local description = icon_description_split[4]

	if not description then
		return nil
	end

	return {
		display = trim(icon) .. " " .. trim(description),
		value = trim(icon)
	}
end


function M.find_emojis()
	local path = vim.fn.stdpath("config") .. "/lua/plugins/spec/telescope-picker/emojis.txt"
	print(path)
	local file = io.open(path, "r")

	if not file then
		print("Emoji File not found")
		return nil
	end

	local t = {}
	for line in file:lines() do
		local parsed_line = parse_emoji_line(line)
		if parsed_line then
			table.insert(t, parsed_line)
		end
	end

	file:close()

	local finder = finders.new_table({
		results = t,
		entry_maker = function(entry)
			return {
				value = entry.value,
				display = entry.display,
				ordinal = entry.display,
			}
		end
	})

	pickers.new(conf, {
		prompt_title = "Find Emojis",
		finder = finder,
		sorter = conf.generic_sorter(t),
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				local buf = vim.api.nvim_get_current_buf()
				local cursor = vim.api.nvim_win_get_cursor(0)
				vim.api.nvim_buf_set_text(buf, cursor[1] - 1, cursor[2], cursor[1] - 1, cursor[2], { selection.value })
				vim.api.nvim_win_set_cursor(0, { cursor[1], cursor[2] + 1 })
			end)
			return true
		end,
	}):find()
end

return M
