return {
    {
        "mg979/vim-visual-multi",
        lazy = false,
    },
    {
        "ggandor/leap.nvim",
        event = "BufReadPost",
        config = function()
            --local leap = require("leap")

            vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        }
    }
}
