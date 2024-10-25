
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.cmd [[source ~/.config/nvim/options.vim]]

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    use 'lewis6991/gitsigns.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'romgrk/barbar.nvim'

    use 'nvim-tree/nvim-tree.lua'

    use 'lervag/vimtex'

    use 'nanotee/zoxide.vim'

    use 'nvim-lua/plenary.nvim'
    use 'kdheepak/lazygit.nvim'

    use 'mg979/vim-visual-multi'

    use 'tikhomirov/vim-glsl'

    use 'feline-nvim/feline.nvim'

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use 'junegunn/goyo.vim'
    use 'godlygeek/tabular'
    use 'elzr/vim-json'
    use 'preservim/vim-markdown'

    use 'stevearc/aerial.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'tpope/vim-fugitive'

    use 'mfussenegger/nvim-dap'
    use 'jay-babu/mason-nvim-dap.nvim'
    use 'nvim-neotest/nvim-nio'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

end)

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

--Setup Status Line
require('feline').setup({
})

--Writing Mode
vim.cmd [[source ~/.config/nvim/writing.vim]]

--LSP
require('mason').setup()
local mason_lspconfig = require('mason-lspconfig')

--DAP
require("mason-nvim-dap").setup({
    automatic_installation = true,
})

require("dap-settings")

--Completion
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities
      }
    end,
  }

-- tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

--Remove whitespace with regex magic
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

--vim.api.nvim_set_keymap(mode, lhs, rhs, options)
vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle <CR>", {noremap = true})

-- Completion
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'

vim.cmd [[source ~/.config/nvim/barbar.vim]]

-- math stuff
vim.cmd [[source ~/.config/nvim/vimtex.vim]]

require('aerial').setup({
  -- use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})

    -- Toggle
    vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
  end
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- add more languages as needed
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
