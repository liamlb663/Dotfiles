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
    use 'mfussenegger/nvim-dap'

    use 'mg979/vim-visual-multi'

    use 'tikhomirov/vim-glsl'

    use 'feline-nvim/feline.nvim'

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'junegunn/goyo.vim'
    use 'preservim/vim-pencil'
end)

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
