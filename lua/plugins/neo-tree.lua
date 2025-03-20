return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- optional image support in preview window: see `# Preview Mode` for more info
  },

  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".DS_Store",
        },
        never_show = {},
        never_show_by_pattern = { -- uses glob style patterns
          ".null-ls_*",
        },
      },
    },
  },

  config = function()
    vim.keymap.set("n", "<C-l>", ":Neotree toggle filesystem reveal_force_cwd left<CR>", {})
  end
}
