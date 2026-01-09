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

-- page down and up with centering
map("n", "<C-d>", "<C-d>zz", "Page down and centre")
map("n", "<C-u>", "<C-u>zz", "Page up and centre")

-- find and centre
map("n", "n", "nzzzv", "Find next and centre")
map("n", "N", "Nzzzv", "Find previous and centre")

-- resize splits with arrows
map("n", "<Up>", "<cmd>resize -2<CR>", "Decrease split height")
map("n", "<Down>", "<cmd>resize +2<CR>", "Increase split height")
map("n", "<Left>", "<cmd>vertical resize -2<CR>", "Decrease split width")
map("n", "<Right>", "<cmd>vertical resize +2<CR>", "Increase split width")

-- buffer navigation
map("n", "<Tab>", "<cmd>bnext<CR>", "Go to next buffer")
map("n", "<S-Tab>", "<cmd>bprevious<CR>", "Go to previous buffer")
map("n", "<leader>x", "<cmd>bdelete<CR>", "Close current buffer")
map("n", "<leader>b", "<cmd>enew<CR>", "Open new buffer")

-- window management
map("n", "<leader>v", "<C-w>v", "Create vertical split")
map("n", "<leader>h", "<C-w>s", "Create horizontal split")
map("n", "<leader>se", "<C-w>=", "Make splits equal")
map("n", "<leader>xs", "<cmd>close<CR>", "Close split")

-- window navigation
map("n", "<C-j>", "<cmd>wincmd j<CR>", "Navigate to split below")
map("n", "<C-k>", "<cmd>wincmd k<CR>", "Navigate to split above") 
map("n", "<C-h>", "<cmd>wincmd h<CR>", "Navigate to split left") 
map("n", "<C-l>", "<cmd>wincmd l<CR>", "Navigate to split right") 
