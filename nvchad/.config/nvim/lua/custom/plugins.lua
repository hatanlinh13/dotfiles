local plugins = {

    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- defaults 
                "vim",
                "lua",

                -- low level
                "c",
                "cpp",
                "rust",
                "python",

                -- scripting
                "bash",
                "fish",

                -- version control
                "diff",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",

                -- web dev 
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
            },
        },
    },

}

return plugins

