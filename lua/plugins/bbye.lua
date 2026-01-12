return {
    "moll/vim-bbye",
    config = function()
        vim.keymap.set(
            "n",
            "<leader>x", 
            "<cmd>Bdelete<CR>", 
            { noremap = true, silent = true, desc = "Close current buffer" }) -- relies on vim-bbye
        end
}
