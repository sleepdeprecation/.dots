-- setup lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- run lazy plugin manager (see lua/plugins.lua for config)
require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

require("lush")(require("lush_theme/sleep"))
--vim.cmd.colorscheme(colors_sleep)

-- vim.cmd.colorscheme("seti-dk")

-- disable language providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- turn off lsp diagnostics messages -- i don't like them in IDEs i like them even less in vim
vim.diagnostic.disable()

-- general vim settings
vim.o.number = true
vim.o.cursorline = true
vim.o.spell = true
vim.o.spelllang = "en"
vim.o.wrap = true
vim.o.linebreak = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.showmode = true
vim.o.ignorecase = true
vim.o.incsearch = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

vim.o.smartcase = true
vim.o.smarttab = true
vim.o.smartindent = true

vim.o.list = true
vim.o.listchars = "tab:> "

-- "graphical" line movement
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("", "<Down>", "gj")
vim.keymap.set("", "<Up>", "gk")
vim.keymap.set("i", "<Down>", "<C-o>gj")
vim.keymap.set("i", "<Up>", "<C-o>gk")

-- commenting out things
vim.cmd[[nmap <localleader>cc gcc]]
vim.cmd[[vmap <localleader>cc gc]]

-- disable mouse
vim.o.mouse = ""

-- autoformat go
-- local format_sync_go = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimports()
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})
