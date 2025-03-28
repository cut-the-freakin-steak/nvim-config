-- lazy complains if we don't specify the leader before we load it
-- set leader to space
vim.g.mapleader = " "

-- required for lazy.nvim (our package manager) to work
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- activates lazy
require("lazy").setup("plugins")

-- set up a file path that we'll store our wanted configurations in
require("vim-options")

-- set up lsp signatures, which are the things that tell you function arguments in a little window
-- require("lsp_signature").setup()
