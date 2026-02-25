return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.icons").setup()
      require("mini.statusline").setup { use_icons = true }
    end,
  },
}
