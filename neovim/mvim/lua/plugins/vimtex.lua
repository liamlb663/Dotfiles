return {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "./.latexmk/aux",
            out_dir = "./.latexmk/out",
            options = {
                "-shell-escape",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            }
        }
        vim.g.vimtex_quickfix_mode = 0
    end,
    keys = {
        { "<localLeader>l", "", desc = "+vimtex" },
    },
}
