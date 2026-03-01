-- filetypes to disable formatting for
local disable_filetypes = {}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      cpp = { "clang-format" },
      c = { "clang-format" },
      h = { "clang-format" },
      lua = { "stylua" },
    },
    format_on_save = function(bufnr)
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 2000,
          lsp_fallback = false,
        }
      end
    end,
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({
          async = true,
          lsp_fallback = false,
          timeout_ms = 2000,
        })
      end,
      mode = { "n", "v" },
      desc = "[F]ormat buffer",
    },
  },
}
