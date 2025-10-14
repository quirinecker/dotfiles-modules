local M = {}

M.multi_grep = function(opts)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local make_entry = require "telescope.make_entry"
	opts = opts or {}
	opts.cwd = opts.cwd or vim.fn.getcwd()

	local finder = finders.new_async_job {
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local segments = vim.split(prompt, "  ")
			local args = { "rg" }

			if segments[1] then
				table.insert(args, "-e")
				table.insert(args, segments[1])
			end

			if segments[2] then
				table.insert(args, "-g")
				table.insert(args, segments[2])
			end

			return vim.tbl_flatten {
				args,
				{ "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
			}
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	}

	pickers.new({}, {
		debounce = 100,
		prompt_title = "Multi Grep",
		finder = finder,
		previewer = conf.grep_previewer(opts),
		sorter = require("telescope.sorters").empty(),
	}):find()
end

M.multi_grep()

return M
