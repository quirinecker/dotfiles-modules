local function keymap(args)
	-- get client
	local bufnr = args.buf
	local client = vim.lsp.get_client_by_id(args.data.client_id)
	if not client then
		return
	end

	-- loading workspace diagnostics
	require('workspace-diagnostics').populate_workspace_diagnostics(client, bufnr)

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<A-k>', function()
		vim.diagnostic.open_float({ focusable = false, border = "rounded" })
	end, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)

	-- autoformat

	if client.supports_method('textDocument/formatting') then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
			buffer = args.buf,
			callback = function()
				if vim.fn.exists(":LspEslintFixAll") == 1 then
					vim.cmd(":LspEslintFixAll")
				else
					vim.lsp.buf.format { bufnr = args.buf, id = client.id }
				end
			end
		})
	end


	-- vim.lsp.inlay_hint.enable(true, { bufnr })
end

local function diagnostic_icons()
	local signs = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " "
	}

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

local function configToHandler(server, config)
	return function()
		require("lspconfig")[server].setup(config)
	end
end

local function lsp_setup()
	local lspconfig = require("lspconfig")
	-- adding edge cases for workspace diagnostics
	require('workspace-diagnostics').setup {
		workspace_files = function()
			local gitPath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
			local workspace_files = vim.fn.split(vim.fn.system("git ls-files " .. gitPath), "\n")
			-- this makes nuxt laod the nuxt typescript definition
			table.insert(workspace_files, '.nuxt/nuxt.d.ts')
			return workspace_files
		end
	}

	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = keymap
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local with_defaults = function(config)
		config.capabilities = capabilities
		return config
	end

	require('mason').setup({
		ui = {
			border = "rounded",
		}
	})
	require('mason-lspconfig').setup { ensure_installed = {} }

	vim.lsp.enable({
		'vue_ls',
		'nil_ls',
		'nixd',
		'rust_analyzer',
		'lua_ls',
		'gdscript',
		'jsonls',
		'r_language_server',
		'tailwindcss',
		'html',
		'taplo',
		'protols',
		'yamlls',
		'clangd',
		'eslint',
		'nushell',
		'tinymist'
		-- 'jdtls'
	})

	-- not collision between deno lsp and ts lsp
	if require("lib.lsp").has_file("deno.json") then
		vim.lsp.enable("denols")
	else
		vim.lsp.enable("vtsls")
		-- vim.lsp.enable("ts_ls") this is disabled vtsls for vue required
	end

	vim.lsp.config('*', with_defaults({}))
	vim.lsp.config('vue_ls', with_defaults(require("plugins.spec.server_configurations.vue")))
	vim.lsp.config('nil_ls', with_defaults(require("plugins.spec.server_configurations.nix")['nil']))
	vim.lsp.config('nixd', with_defaults(require("plugins.spec.server_configurations.nix")['nixd']))
	vim.lsp.config('rust_analyzer', with_defaults(require("plugins.spec.server_configurations.rust")))
	vim.lsp.config('lua_ls', with_defaults(require("plugins.spec.server_configurations.lua")))
	vim.lsp.config('gdscript', with_defaults(require("plugins.spec.server_configurations.gdscript")))
	vim.lsp.config('ts_ls', with_defaults(require("plugins.spec.server_configurations.typescript").config()))
	vim.lsp.config('jsonls', with_defaults(require("plugins.spec.server_configurations.json")))
	vim.lsp.config('yamlls', with_defaults(require("plugins.spec.server_configurations.yaml")))
	vim.lsp.config('denols', with_defaults(require("plugins.spec.server_configurations.deno").config()))
	vim.lsp.config('r_language_server', with_defaults({
		cmd = { "R", "--no-echo", "-e", "languageserver::run()" }
	}))
	vim.lsp.config('jdtls', with_defaults(require("plugins.spec.server_configurations.java")))
	vim.lsp.config('tailwindcss', with_defaults(require("plugins.spec.server_configurations.tailwindcss")))
	vim.lsp.config('html', with_defaults(require("plugins.spec.server_configurations.html")))
	vim.lsp.config('taplo', with_defaults(require("plugins.spec.server_configurations.taplo")))
	vim.lsp.config('protols', with_defaults(require("plugins.spec.server_configurations.proto")))
	vim.lsp.config('clangd', with_defaults(require("plugins.spec.server_configurations.clang")))
	vim.lsp.config('vtsls', with_defaults(require("plugins.spec.server_configurations.vtsls").config()))
	vim.lsp.config('eslint', with_defaults(require("plugins.spec.server_configurations.eslint")))
	vim.lsp.config('tinymist', with_defaults({
		cmd = { "tinymist" }
	}))

	vim.diagnostic.config({
		virtual_text = {
			prefix = '●', -- or '■', '▎', 'x', '' whatever you want
			spacing = 2,
		},
		underline = true,
		update_in_insert = false, -- set to true if you want real-time errors while typing
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "",
			}
		}
	})
end

return {
	'neovim/nvim-lspconfig',
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		lsp_setup()
	end,
	dependencies = {
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		'artemave/workspace-diagnostics.nvim',
	}
}
