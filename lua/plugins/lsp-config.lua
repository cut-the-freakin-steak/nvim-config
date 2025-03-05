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
            require("mason-lspconfig").setup({
                -- ensure_installed makes sure that lsps that you want installed
                -- are installed
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "pylsp",
                    "ruff",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- configurations for autocompletion
            -- lua stuff
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- c stuff
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })

            -- python stuff
            lspconfig.ruff.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n" }, "<space>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
