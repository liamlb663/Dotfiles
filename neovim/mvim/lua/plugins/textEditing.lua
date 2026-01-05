return {
    {
        "mg979/vim-visual-multi",
        lazy = false,
    },
    {
        "ggandor/leap.nvim",
        event = "BufReadPost",
        config = function()
            vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
        end,
    },
}
