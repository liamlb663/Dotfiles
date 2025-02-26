return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
            ensure_installed =
                { "c", "cpp", "lua", "vim", "html", "rust", "python", "glsl" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
