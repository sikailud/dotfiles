-- ~/.config/init.lua

local o = vim.opt
local g = vim.g
local keymap = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Options
o.guicursor = "i:block"
o.termguicolors = true
o.ignorecase = true
o.swapfile = false
o.autoindent = true
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.shiftround = true
o.smartindent = true
o.list = true
o.number = true
o.relativenumber = true
o.scrolloff = 5
o.cmdheight = 1
o.laststatus = 1
o.inccommand = "nosplit"
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
o.completeopt = { "menuone", "popup", "noinsert" }
o.winborder = "shadow"
o.ignorecase = true
o.incsearch = true
o.hlsearch = true
o.showmatch = true
g.netrw_banner = 0
g.python_recommended_style = 0
g.gdscript_recommended_style = 0
vim.cmd.filetype("plugin indent on")

-- Keymaps
g.mapleader = " "
keymap("n", "<leader>=", ":vs ~/.config/nvim/init.lua<CR>")
keymap("n", "<leader>e", ":Ex<CR>")
keymap("n", "<leader>9", ":vs<CR>")
keymap("n", "<leader>0", ":sp<CR>")
keymap("n", "<leader>h", "<C-W>h")
keymap("n", "<leader>j", "<C-W>j")
keymap("n", "<leader>k", "<C-W>k")
keymap("n", "<leader>l", "<C-W>l")
keymap("n", "<leader>p", ":Lazy<CR>")
keymap("n", "<silent> <ESC><ESC>", ":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>")

keymap("n", "j", function()
  return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true })

keymap("n", "k", function()
  return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })

-- Autocmds
local yank_highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 112 })
  end,
  group = yank_highlight_group
})

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    "tpope/vim-commentary",
    "tpope/vim-fugitive",
    {
      "bluz71/vim-moonfly-colors",
      config = function()
        vim.cmd.colorscheme("moonfly")
      end
    }
  },
  checker = { enabled = true },
})

