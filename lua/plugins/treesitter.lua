return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- ensure_installed will turn on syntax highlighting for any languages inside of the table
      ensure_installed = { "c", "lua", "python" },
      -- turns on code highlighting and indenting
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
