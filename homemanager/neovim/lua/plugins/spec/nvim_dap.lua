return {
    'mfussenegger/nvim-dap',
    dependencies = {
        {'jay-babu/mason-nvim-dap.nvim', opts = {
            handlers = {
                function (config)
                    require('mason-nvim-dap').default_setup(config)
                end,
                cppdbg = function (config)
                    config.adapters.lldb = {
                        type = 'executable',
                        command = 'lldb-vscode',
                        name = 'lldb'
                    }
                    require('mason-nvim-dap').default_setup(config)
                end
            }
        }}
    }
}
