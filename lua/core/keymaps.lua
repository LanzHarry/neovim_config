local function map(mode, map_keys, map_command, desc)
    local opts = { noremap = true, silent = true, desc = desc}
    -- could implement this with vim.tbl_extend if needed
    vim.keymap.set(mode, map_keys, map_command, opts)
end
-- text editing keymaps

map("n", "<A-j>", "<cmd>m .+1<CR>==", "Move line down")
map("n", "<A-k>", "<cmd>m .-2<CR>==", "Move line up")

map("x", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("x", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")
