-- remap helper function
-- noremap and silent are always true, desc is user settable parameter
local function map(mode, map_keys, map_command, desc)
    local opts = { noremap = true, silent = true, desc = ""}
    opts.desc = desc or ""
    -- could implement this with vim.tbl_extend if needed
    vim.keymap.set(mode, map_keys, map_command, opts)
end

-- set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map({ "n", "v" }, "<Space>", "<Nop>")

-- line moving 
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi<cmd>normal! zz<CR>", "Move line up (insert mode)")
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi<cmd>normal! zz<CR>", "Move line down (insert mode)")

map("n", "<A-j>", "<cmd>m .+1<CR>==<cmd>normal! zz<CR>", "Move line down")
map("n", "<A-k>", "<cmd>m .-2<CR>==<cmd>normal! zz<CR>", "Move line up")

map("x", "<A-j>", ":m '>+1<CR>gv=gv<cmd>normal! zz<CR>", "Move selection down")
map("x", "<A-k>", ":m '<-2<CR>gv=gv<cmd>normal! zz<CR>", "Move selection up")

-- save file (might need stty -ixon in some terminals)
map({ "i", "n" }, "<C-s>", "<cmd>update<CR>", "Save file")

-- save file no auto formatting
map("n", "<leader>sn", "<cmd>noautocmd w<CR>", "Save file no auto-format")

-- quit file
map("n", "<C-q>", "<cmd>q<CR>", "Quit file")

-- delete single character without copying into default register
map("n", "x", '"_x', "Delete char with no register copy")
