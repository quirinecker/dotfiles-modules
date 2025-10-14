return {
	{
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function()
			require("catppuccin").setup {
				flavour = "mocha",
				transparent_background = true
			}
			-- vim.cmd [[ colorscheme catppuccin ]]
		end
	},
	{
		'EdenEast/nightfox.nvim',
		config = function()
			require('nightfox').setup {
				options = { transparent = true }
			}

			-- vim.cmd [[ colorscheme nightfox ]]
		end,
	},
	{
		'navarasu/onedark.nvim',
		config = function()
			require('onedark').setup {
				transparent = true,
				lualine = {
					transparent = true
				}
			}

			-- vim.cmd [[ colorscheme onedark ]]
		end
	},
	{
		'shaunsingh/nord.nvim',
		config = function()
			vim.g.nord_disable_background = true
			vim.cmd [[colorscheme nord]]
		end
	}
}
