return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    lazy=false,
    priority = 900,
    config = function()
      require("mini.icons").setup()
      require("mini.statusline").setup { use_icons = true }
      require("mini.ai").setup()
      require("mini.surround").setup()
    end,
  },
}
