return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
    },
    config = function()
        local mason = require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "rust_analyzer",
            },
            automatic_installation = true,
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- LSP keybindings
        local on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            local keymap = vim.keymap.set

            keymap("n", "gd", vim.lsp.buf.definition, opts)
            keymap("n", "gD", vim.lsp.buf.declaration, opts)
            keymap("n", "gr", vim.lsp.buf.references, opts)
            keymap("n", "gi", vim.lsp.buf.implementation, opts)
            keymap("n", "K", vim.lsp.buf.hover, opts)
            keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
            keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            keymap("n", "[d", vim.diagnostic.goto_prev, opts)
            keymap("n", "]d", vim.diagnostic.goto_next, opts)
            keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
            keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
        end

        vim.lsp.config("*", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                },
            },
        })

        vim.diagnostic.config({
            virtual_text = { spacing = 4, prefix = "●" },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        -- UI Enhancements
        require("fidget").setup({})
    end,
}

