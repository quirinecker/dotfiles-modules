local function oil()
    require("oil").open()
end

return {
    'stevearc/oil.nvim',
    opts = {
        view_options = {
            show_hidden = true
        }
    },
    lazy = false,
    cmd = 'Oil',
    keys = {
        {"<leader>ft", oil, ""}
    },
    dependencies = {
        'kyazdani42/nvim-web-devicons',
    }
}
