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
        priority = 1000 ,
    },
    {
        "alexxGmZ/e-ink.nvim",
        priority = 1000,
        config = function ()
            require("e-ink").setup()
            --vim.cmd.colorscheme "e-ink"

            vim.opt.background = "dark"
        end
    }
}
