return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim", -- Package manager for LSP servers
        "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
        "hrsh7th/nvim-cmp", -- Autocompletion
        "hrsh7th/cmp-nvim-lsp", -- LSP completion source for nvim-cmp
        "j-hui/fidget.nvim", -- LSP progress notifications
        -- "folke/neodev.nvim", -- Enhancements for Neovim development
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        -- Enable Mason and Mason-LSPConfig
        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "rust_analyzer",
            },
            automatic_installation = true,
        })

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

        -- LSP Server Configuration
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    },
                },
            },
        }

        -- Setup each LSP server
        for server, config in pairs(servers) do
            lspconfig[server].setup(vim.tbl_deep_extend("force", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                on_attach = on_attach,
            }, config))
        end

        -- Automatically setup any LSP installed via Mason
        mason_lspconfig.setup_handlers({
            function(server_name)
                if not servers[server_name] then
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end
            end,
        })

        -- UI Enhancements
        require("fidget").setup({})
        -- require("neodev").setup({})
    end,
}

