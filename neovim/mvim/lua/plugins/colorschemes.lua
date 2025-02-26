return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
    },
    {
        "alexxGmZ/e-ink.nvim",
        lazy = false,
        config = function ()
            vim.opt.background = "dark"
        end
    }
}
