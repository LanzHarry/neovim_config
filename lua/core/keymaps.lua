local function map(mode, map_keys, map_command, desc)
    local opts = { noremap = true, silent = true, desc = desc}
    -- could implement this with vim.tbl_extend if needed
    vim.keymap.set(mode, map_keys, map_command, opts)
end
-- text editing keymaps

map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi<cmd>normal! zz<CR>", "Move line up (insert mode)")
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi<cmd>normal! zz<CR>", "Move line down (insert mode)")

map("n", "<A-j>", "<cmd>m .+1<CR>==<cmd>normal! zz<CR>", "Move line down")
map("n", "<A-k>", "<cmd>m .-2<CR>==<cmd>normal! zz<CR>", "Move line up")

map("x", "<A-j>", ":m '>+1<CR>gv=gv<cmd>normal! zz<CR>", "Move selection down")
map("x", "<A-k>", ":m '<-2<CR>gv=gv<cmd>normal! zz<CR>", "Move selection up")
