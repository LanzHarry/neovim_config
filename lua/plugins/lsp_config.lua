return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- following rough structure of kickstart
      -- could add keymaps in here for go to definition etc

      -- servers to install using mason
      local servers = {
        pyright = {},
        clangd = {},
      }

      -- ensure servers AND tools are installed here
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "lua-language-server", -- note ensure installed here but enable manually
        "stylua",
      })

      require("mason-tool-installer").setup {
        ensure_installed = ensure_installed,
      }

      for server_name, server_settings in pairs(servers) do
        vim.lsp.config(server_name, server_settings)
        vim.lsp.enable(server_name)
      end

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")
    end,
  },
}
