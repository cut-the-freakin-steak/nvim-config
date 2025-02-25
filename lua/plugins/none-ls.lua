-- none-ls is a tool that helps manage linters and formatters with mason
-- remember that once you set it in sources, you also have to install it in mason
-- by doing :Mason and installing whatever your source is
return {
	"nvimtools/none-ls.nvim",
    dependencies = {
        -- necessary for some linters, and formatters
        -- some stuff isn't included in standard none-ls so we need to add an extra
        -- require() from none-ls-extras
        "nvimtools/none-ls-extras.nvim"
    },

	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			-- where we declare what linters and formatters we want to add
			sources = {
                -- lua stuff
				null_ls.builtins.formatting.stylua,
				-- gdscript stuff
                null_ls.builtins.formatting.gdformat,
				null_ls.builtins.diagnostics.gdlint,
                -- c stuff
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.trivy,
                -- python stuff
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
			},
		})
		-- press <space> then gf to auto-format the current file
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
