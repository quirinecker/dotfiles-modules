local dap = require("dap")

dap.configurations.rust = {
    {
        name = 'somethign',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.getcwd() .. '/target/debug/docki'
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false
    }
}
