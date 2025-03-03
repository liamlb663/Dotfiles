return {
    {
        "mg979/vim-visual-multi",
        lazy = false,
    },
    {
        "ggandor/leap.nvim",
        event = "BufReadPost",
        config = function()
            local leap = require("leap")
            leap.add_default_mappings()
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        }
    }
}
