return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
        "hrsh7th/nvim-cmp",
        "nvim-treesitter/nvim-treesitter"
    },
    cmd = {
        "ObsidianOpen",
        "ObsidianToday",
        "ObsidianNewFromTemplate",
        "ObsidianLink",
        "ObsidianFollowLink",
        "ObsidianBacklinks",
        "ObsidianRename"
    },
    keys = {
        { "<leader>oo", ":ObsidianOpen<CR>",
            desc = "Open Obsidian" },
        { "<leader>ot", ":ObsidianToday<CR>",
            desc = "Open today's daily note" },
        { "<leader>on", ":ObsidianNew", mode = "n",
            desc = "Create a new note" },
        { "<leader>ol", ":ObsidianLink<CR>",
            desc = "Create a Markdown link to the note under the cursor" },
        { "<leader>of", ":lua require('fzf-lua').files({ cwd = '~/Documents/Obsidian/main' })<CR>",
            desc = "Search files in Obsidian vault" },
        { "<leader>og", ":lua require('fzf-lua').live_grep({ cwd = '~/Documents/Obsidian/main' })<CR>",
            desc = "Live grep in Obsidian vault" },
        { "gd", ":ObsidianFollowLink<CR>",
            desc = "Go to the definition of a wiki link" },
        { "<leader>ob", ":ObsidianBacklinks<CR>",
            desc = "Show backlinks to current note" },
        { "<leader>os", ":lua require('fzf-lua').grep({ search = vim.fn.expand('<cword>'), cwd = '~/Documents/ObsidianVault' })<CR>",
            desc = "Search backlinks using FzfLua" },
        { "<leader>or", ":ObsidianRename ", mode = "n",
            desc = "Rename current note" }
    },
    config = function()
        require("obsidian").setup({
            dir = "~/Documents/Obsidian/main",
            completion = {
                nvim_cmp = true,
            },
            daily_notes = {
                folder = "Daily",
                -- template = "daily.md",
            },
            --templates = {
            --    subdir = "Templates",
            --    date_format = "%Y-%m-%d",
            --    time_format = "%H:%M",
            --},
            picker = {
                name = "fzf-lua",
            },
            ui = {
                enable = false,
            },
            notes = {
                new_note_location = "Notes",
                template = "metadata-template",  -- Automatically apply this template
            },
        })

        local opts = { noremap = true, silent = true }

        -- Open Obsidian
        vim.api.nvim_set_keymap("n", "<leader>oo", ":ObsidianOpen<CR>", opts)

        -- Open today's daily note
        vim.api.nvim_set_keymap("n", "<leader>ot", ":ObsidianToday<CR>", opts)

        -- Create a new note
        vim.api.nvim_set_keymap("n", "<leader>on", ":ObsidianNew<CR>", { noremap = true, silent = false })

        -- Create a Markdown link to the note under the cursor
        vim.api.nvim_set_keymap("n", "<leader>ol", ":ObsidianLink<CR>", opts)

        -- FzfLua for file search inside vault
        vim.api.nvim_set_keymap("n", "<leader>of", ":lua require('fzf-lua').files({ cwd = '~/Documents/Obsidian/main' })<CR>", opts)

        -- FzfLua for live grep inside vault
        vim.api.nvim_set_keymap("n", "<leader>og", ":lua require('fzf-lua').live_grep({ cwd = '~/Documents/Obsidian/main' })<CR>", opts)

        -- Go to the definition of a wiki link
        vim.api.nvim_set_keymap("n", "gd", ":ObsidianFollowLink<CR>", opts)

        -- Backlinks to current note
        vim.api.nvim_set_keymap("n", "<leader>ob", ":ObsidianBacklinks<CR>", opts)

        -- Open backlinks search with FzfLua
        vim.api.nvim_set_keymap("n", "<leader>os", ":lua require('fzf-lua').grep({ search = vim.fn.expand('<cword>'), cwd = '~/Documents/ObsidianVault' })<CR>", opts)

        -- Rename current note (updates links)
        vim.api.nvim_set_keymap("n", "<leader>or", ":ObsidianRename ", { noremap = true, silent = false })
    end
}
