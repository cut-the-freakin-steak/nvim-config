-- tabs to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- python buffoonery for 2 space tabs
vim.cmd("let g:python_recommended_style = 0")

-- turn on numbers on the left side of the editor
vim.cmd("set number")

-- enable true color set insert mode cursor to block
vim.cmd("set guicursor=i:block")

-- get rid of the tildes at the bottom of the file
vim.opt.fillchars = { eob = " " }

-- turn on word wrap, breaking at each word, and not in the middle of one
vim.opt.wrap = true
vim.opt.linebreak = true

-- add functionality for godot stuff
-- local godot_project_file = vim.fn.getcwd() .. "/project.godot"
--
-- if godot_project_file then
--   vim.fn.serverstart "./godothost"
-- end

-- make system clipboard and nvim clipboard sync up
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- see full diagnostic message in case it goes out of screen bounds
vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>gd", "<cmd>CompilerOpen<cr>")

-- chooses what color theme nvim uses
-- i use catppuccin right now, its nice
vim.o.background = "dark"
-- vim.cmd.colorscheme "catppuccin-mocha"

-- vim.api.nvim_set_hl(0, "Normal", {guibg = NONE, ctermbg = NONE})
