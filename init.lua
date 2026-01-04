require("core.options")
require("core.keymaps")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	{
	    "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
	      "nvim-lua/plenary.nvim",
	      "MunifTanjim/nui.nvim",
	      "nvim-tree/nvim-web-devicons", -- optional, but recommended
	    },
	    lazy = false, -- neo-tree will lazily load itself
	    config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_ignored = true,
				},
			},
		})
	    end
  },

  {
	  "catppuccin/nvim", 
	  name = "catppuccin",
	  lazy = false,
	  priority = 1000,
	  config = function()
		  require("catppuccin").setup {
			  highlight_overrides = {
				  all = function(colors)
					  return {
						  LineNr = { fg = "#FF00C3" },
					  }
				  end,
				  }
		  }
		  vim.cmd.colorscheme("catppuccin-mocha")
	  end
  }
})
