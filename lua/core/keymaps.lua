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

-- custom escape sequence using rare digram
map("i", "jk", "<Esc>", "Alternative to escape for leaving insert mode")
map("i", "kj", "<Esc>", "Alternative to escape for leaving insert mode")

-- remap moving to the end of a line to more ergonomic keys
map({ "n", "v", "o" }, "H", "^", "Go to start of visible text")
map({ "n", "v", "o" }, "L", "g_", "Go to end of visible text")

-- line moving (slightly buggy at bof and eof but useable)
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
map({ "i", "n" }, "<C-q>", "<cmd>q<CR>", "Quit file")

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

-- split management
map("n", "<leader>v", "<C-w>v", "Create vertical split")
map("n", "<leader>h", "<C-w>s", "Create horizontal split")
map("n", "<leader>se", "<C-w>=", "Make splits equal")
map("n", "<leader>sx", "<cmd>close<CR>", "Close split")

-- split navigation
map("n", "<C-j>", "<cmd>wincmd j<CR>", "Navigate to split below")
map("n", "<C-k>", "<cmd>wincmd k<CR>", "Navigate to split above") 
map("n", "<C-h>", "<cmd>wincmd h<CR>", "Navigate to split left") 
map("n", "<C-l>", "<cmd>wincmd l<CR>", "Navigate to split right") 

-- buffer navigation
map("n", "<Tab>", "<cmd>bnext<CR>", "Go to next buffer")
map("n", "<S-Tab>", "<cmd>bprevious<CR>", "Go to previous buffer")
-- map("n", "<leader>x", "<cmd>Bdelete<CR>", "Close current buffer") -- relies on vim-bbye so defined in plugin
map("n", "<leader>b", "<cmd>enew<CR>", "Open new buffer")

-- tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab")
map("n", "<leader>tx", "<cmd>tabclose<CR>", "Close tab")
map("n", "<leader>tn", "<cmd>tabn<CR>", "Next tab")
map("n", "<leader>tp", "<cmd>tabp<CR>", "Previous tab")

-- toggle line wrapping
map("n", "<leader>lw", "<cmd>set wrap!<CR>", "Toggle line wrapping")

-- stay in visual mode for indenting
map("v", "<", "<gv", "Stay in visual mode post un-indent")
map("v", ">", ">gv", "Stay in visual mode post indent")

-- keep last yank when pasting over
map("v", "p", '"_dP', "Paste but do not copy overwritten text to clipboard")

-- diagnostic keymaps
map("n", "[d", 
function() vim.diagnostic.jump {
    count = -1,
    float = true
} end,
"Go to previous diagnostic message and open floating window")

map("n", "]d", 
function() vim.diagnostic.jump {
    count = 1,
    float = true
} end,
"Go to next diagnostic message and open floating window")

map("n", "<leader>d", vim.diagnostic.open_float, "Open diagnostic message in floating window")
map("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")
