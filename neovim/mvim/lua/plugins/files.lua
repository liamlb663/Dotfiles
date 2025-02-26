return {
    {   -- Tabs
        'romgrk/barbar.nvim',
        lazy = false,
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        config = function()
            require("barbar").setup()

            local keymap = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }

            keymap("n", "<C-PageUp>", "<Cmd>BufferPrevious<CR>", opts)
            keymap("n", "<C-PageDown>", "<Cmd>BufferNext<CR>", opts)

            for i = 1, 9 do
                keymap("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", opts)
            end
            keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

            keymap("n", "<C-x>", "<Cmd>BufferClose<CR>", opts)
        end,
    },
    {   -- File Tree
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        keys = {
            { "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
        },
        cmd = {
            "NvimTreeToggle",
            "NvimTreeOpen",
            "NvimTreeFocus",
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup(

            vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle <CR>", {noremap = true}))
        end
    },
}
