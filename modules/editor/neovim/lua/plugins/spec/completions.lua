local function setup()
	-- Set up nvim-cmp
	local cmp = require 'cmp'
	local lspkind = require('lspkind')
	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				local luasnip = require("luasnip")
				if not luasnip then
					return
				end
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' }, -- For luasnip users.
			-- { name = 'emoji' }
		}, {
			{ name = 'buffer' },
		}),
		formatting = {
			format = lspkind.cmp_format({
				mode = 'symbol',
				maxwidth = 50,
				ellipsis_char = 'b',
				before = function(entry, vim_item)
					return vim_item
				end
			})
		}
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})

	-- auto pairs
	local cmp_autopairs = require('nvim-autopairs.completion.cmp')
	cmp.event:on(
		'confirm_done',
		cmp_autopairs.on_confirm_done()
	)
end

return {
	'hrsh7th/nvim-cmp',
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		setup()
	end,
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'onsails/lspkind.nvim',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-emoji',
		{ 'windwp/nvim-autopairs', opts = {} },
		require('plugins.spec.snippets'),
		require('plugins.spec.lsp'),
		require('plugins.spec.jdtls')
	}
}
