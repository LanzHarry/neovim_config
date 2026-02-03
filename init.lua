-- set leader keys and sanitisation mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<nop>", { noremap = true, silent = true, desc = ""})
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true, desc = ""})

-- requirements starting with lazy
require("core.lazy")
require("core.options")
require("core.keymaps")
require("core.autocmds")
