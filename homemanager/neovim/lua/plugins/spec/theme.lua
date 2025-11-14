return {
	{
		'catppuccin/nvim',
		as = 'catppuccin',
		enabled = false,
		config = function()
			require("catppuccin").setup {
				flavour = "mocha",
				transparent_background = true
			}
			vim.cmd [[ colorscheme catppuccin ]]
		end
	},
	{
		'EdenEast/nightfox.nvim',
		enabled = false,
		config = function()
			require('nightfox').setup {
				options = { transparent = true }
			}

			vim.cmd [[ colorscheme nightfox ]]
		end,
	},
	{
		'navarasu/onedark.nvim',
		enabled = false,
		config = function()
			require('onedark').setup {
				transparent = true,
				lualine = {
					transparent = true
				}
			}

			vim.cmd [[ colorscheme onedark ]]
		end
	},
	{
		'shaunsingh/nord.nvim',
		enabled = false,
		config = function()
			vim.g.nord_disable_background = true
			vim.cmd [[colorscheme nord]]
		end
	},
	{
		'rmehri01/onenord.nvim',
		enabled = true,
		config = function()
			require('onenord').setup({
				disable = {
					background = true, -- Disable setting the background color
					float_background = true, -- Disable setting the background color for floating windows
					cursorline = true, -- Disable the cursorline
					eob_lines = true, -- Hide the end-of-buffer lines
				}
			})
		end
	}
}
