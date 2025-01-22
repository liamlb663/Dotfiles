vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "folke/tokyonight.nvim"

    use 'SirVer/ultisnips'

    use 'lewis6991/gitsigns.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'romgrk/barbar.nvim'

    use 'nvim-tree/nvim-tree.lua'

    use 'lervag/vimtex'

    use 'nvim-lua/plenary.nvim'
    use 'kdheepak/lazygit.nvim'

    use 'mg979/vim-visual-multi'

    use 'feline-nvim/feline.nvim'

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use 'stevearc/aerial.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)

vim.cmd([[colorscheme tokyonight]])
