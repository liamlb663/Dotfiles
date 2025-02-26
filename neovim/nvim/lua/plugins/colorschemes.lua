return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "gruvbox"
        end
    },
    {
        "alexxGmZ/e-ink.nvim",
        lazy = false,
    }
}
