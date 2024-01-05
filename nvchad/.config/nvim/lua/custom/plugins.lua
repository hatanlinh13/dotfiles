local plugins = {

    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            auto_install = true,
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },

}

return plugins
