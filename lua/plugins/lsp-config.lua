return {
  {
    -- install mason, an lsp installer
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        -- ensure_installed makes sure that lsps that you want installed
        -- are installed
        ensure_installed = {
          "lua_ls",
          "clangd",
          "ruff",
          "pylsp",
        },

        handlers = {
          function(lsp)
            -- specific lsp configurations
            if lsp == "pylsp" then
              require("lspconfig").pylsp.setup({
                capabilities = capabilities,
                settings = {
                  pylsp = {
                    plugins = {
                      pycodestyle = {
                        enabled = false,
                      },
                      pydocstyle = {
                        enabled = false,
                      },
                      pyflakes = {
                        enabled = false,
                      },
                      mccabe = {
                        enabled = false,
                      },
                      autopep8 = {
                        enabled = false,
                      },
                      yapf = {
                        enabled = false,
                      },
                      flake8 = {
                        enabled = false,
                      },
                      pylint = {
                        enabled = false,
                      },
                    },
                  },
                },
              })

              -- a catch all for every language server if we don't need configs
            else
              require("lspconfig")[lsp].setup({
                capabilities = capabilities,
              })
            end
          end,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- setup for gdscript lsp because its not in mason lmao
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      require("lspconfig").gdscript.setup(capabilities)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<space>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
