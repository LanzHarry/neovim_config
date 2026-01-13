return {
    "catppuccin/nvim", 
    name = "catppuccin",
    lazy = false,
    priority = 1000,

    -- apply colourtheme before highlights are set
    init = function()
        vim.cmd.colorscheme("catppuccin-mocha")
    end,

    -- lazy.nvim opts format for everything else
    opts = {
        highlight_overrides = {
            all = function()
                return {
                    LineNr = { fg = "#FF00C3" },
                }
            end,
        },
    }
}
