local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local g_opts = { clear = true }

local user_config_group = augroup("UserConfig", g_opts)

-- turn off auto comment insertion, can be modified per filetype
vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable auto comment insertion",
  group = user_config_group,
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
