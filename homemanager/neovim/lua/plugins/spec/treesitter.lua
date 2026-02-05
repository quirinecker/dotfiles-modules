return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup {
				ensure_installed = {
					"lua",
					"typescript",
					"javascript",
					"css",
					"html",
					"json",
					"markdown",
					"markdown_inline",
					"yaml",
					"rust",
					"python",
					"gdscript",
					"vue",
					"toml",
				},
				highlight = {
					enable = true
				},
				indent = {
					enable = true
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["afn"] = "@function.outer",
							["ifn"] = "@function.inner",
							["acl"] = "@class.outer",
							["icl"] = "@class.inner",
							["icm"] = "@comment.inner",
							["acm"] = "@comment.outer",
							["ib"] = "@block.inner",
							["ab"] = "@block.outer",
							["la"] = "@assignment.lhs",
							["ra"] = "@assignment.lhs"
						},
					}
				}
			}
		end,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		}
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
			trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
		}
	},
}
