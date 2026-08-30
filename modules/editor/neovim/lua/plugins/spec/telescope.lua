local dropdown_configs = {
	layout_strategy = 'horizontal',
	layout_config = {
		prompt_position = 'bottom',
		horizontal = {
			width = 0.8,
			height = 100,
		},
	},
}

local function find_files()
	require("telescope.builtin").find_files()
end

local function find_references()
	require('telescope.builtin').lsp_references()
end
local function find_buffers()
	require('telescope.builtin').buffers()
end

local function find_helptags()
	require('telescope.builtin').help_tags()
end

local function find_directories()
	require('plugins.spec.telescope-picker.find_directories').find_directories()
end

local function find_grep()
	require('plugins.spec.telescope-picker.multi_grep').multi_grep()
end

local function find_emojis()
	require('plugins.spec.telescope-picker.find_emojis').find_emojis()
end

local function find_diagnostics()
	require('telescope.builtin').diagnostics()
end

local function find_commits()
	require('telescope.builtin').git_bcommits()
end

local focus_preview = function(prompt_bufnr)
			local action_state = require("telescope.actions.state")
			local picker = action_state.get_current_picker(prompt_bufnr)
			local prompt_win = picker.prompt_win
			local previewer = picker.previewer
			local winid = previewer.state.winid
			local bufnr = previewer.state.bufnr
			vim.keymap.set("n", "<Tab>", function()
				vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
			end, { buffer = bufnr })
			vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
			-- api.nvim_set_current_win(winid)
end

return {
	'nvim-telescope/telescope.nvim',
	config = function()
		require('telescope').setup({
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(dropdown_configs),
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
				},
				git_bcommits = {
					mappings = {
						i = {
							["<Tab>"] = focus_preview,
						},
						n = {
							["<Tab>"] = focus_preview,
						},
					}
				}
			},
		})

		require('telescope').load_extension('ui-select')

		vim.api.nvim_create_user_command("FindPluginFiles", function()
			require('telescope.builtin').find_files({
				cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy'),
			})
		end, {})

		vim.api.nvim_create_user_command("FindEmojis", function()
			find_emojis()
		end, {})
	end,
	keys = {
		{ '<leader>ff',  find_files,       desc = "(f)ind (f)iles" },
		{ '<leader>gr',  find_references,  desc = "(g)o to (r)eferences" },
		{ '<leader>fg',  find_grep,        desc = "(f)ind (g)rep" },
		{ '<leader>fb',  find_buffers,     desc = "(f)ind (b)uffers" },
		{ '<leader>fht', find_helptags,    desc = "(f)ind (b)elp tags" },
		{ '<leader>fd',  find_directories, desc = "(f)ind (d)irectories" },
		{ '<leader>dl',  find_diagnostics, desc = "(d)iagnostics (l)ist" },
		{ '<leader>fc',  find_commits,     desc = "(f)ind (c)ommits" },
	},
	cmd = { "Telescope", "FindPluginFiles", "FindEmojis" },
	dependencies = {
		'nvim-telescope/telescope-ui-select.nvim',
		'nvim-lua/plenary.nvim',
		'kyazdani42/nvim-web-devicons',
	}
}
