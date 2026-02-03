-- set leader keys and sanitisation mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map({ "n", "v" }, "<Space>", "<nop>")
map("n", "Q", "<nop>")

-- requirements starting with lazy
require("core.lazy")
require("core.options")
require("core.keymaps")
require("core.autocmds")
