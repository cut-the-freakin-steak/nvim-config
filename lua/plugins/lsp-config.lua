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
                    -- a catch all for every language server if we don't need configs
                    function(lsp)
                        require("lspconfig")[lsp].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- specific configurations for some lsps
                    -- python (use pylsp for completions and ruff for everything else)
                    ["pylsp"] = function()
                        require("lspconfig").pylsp.setup({
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
                                        }
                                    },
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n" }, "<space>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
