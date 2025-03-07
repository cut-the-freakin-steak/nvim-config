-- tabs to 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- turn on numbers on the left side of the editor
vim.cmd("set number")

-- get rid of the tildes at the bottom of the file
vim.opt.fillchars = { eob = " " }

-- turn on word wrap, breaking at each word, and not in the middle of one
vim.opt.wrap = true
vim.opt.linebreak = true

-- make system clipboard and nvim clipboard sync up
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- chooses what color theme nvim uses
-- i use material deep ocean right now, its nice
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

vim.api.nvim_set_hl(0, "Normal", {guibg = NONE, ctermbg = NONE})

