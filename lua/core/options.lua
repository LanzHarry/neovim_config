-- core editor options
vim.opt.number = true -- make line numbers visible
vim.opt.relativenumber = true -- set line numbers to be relative to current line
vim.opt.clipboard = "unnamedplus" -- sync clipboard between OS clipboard and neovim registers
vim.opt.wrap = false -- prevent line wrapping
-- vim.opt.linebreak = false -- soft linewrapping (only relevant when wrap is true)
vim.opt.colorcolumn = "80,100" -- column to show where 80 character limit is
vim.opt.mouse = "a" -- enable mouse mode in all modes
vim.opt.autoindent = true -- indent new line same as current line
vim.opt.ignorecase = true -- ignore case in search unless \C or capital in search
vim.opt.smartcase = true -- paired with ignorecase to give correct functionality as described above
vim.opt.shiftwidth = 4 -- number of spaces for an indentation
vim.opt.tabstop = 4 -- number of spaces for a tab
vim.opt.softtabstop = 4 -- number of spaces a tab counts for whilst editing
vim.opt.expandtab = true -- turn tab into spaces
vim.opt.scrolloff = 8 -- keep this many lines above and below cursor vertically
vim.opt.sidescrolloff = 8 -- keep this many columns visible either side of cursor horizontally
vim.opt.cursorline = true -- highlight line the cursor is on
vim.opt.splitbelow = true -- horizontal splits are placed below by default
vim.opt.splitright = true -- vertical splits are placed right by default
vim.opt.hlsearch = true -- show search results as highlighted (set <leader> h to clear)
vim.opt.showmode = true -- show what interaction mode vim is in (set to false if statusline plugin installed)
vim.opt.termguicolors = true -- enable 24 bit colour
vim.opt.whichwrap = "bs<>[]hl" -- which cursor keys can move cursor across lines at start/end
vim.opt.numberwidth = 4 -- width of number column
vim.opt.swapfile = false -- whether to create a swapfile
vim.opt.backup = false -- whether to create backups
vim.opt.writebackup = false -- whether to write directly to disk
vim.opt.undofile = true -- save undo history
-- vim.opt.undodir = nil -- uses default in state dir
vim.opt.undolevels = 10000 -- max undo steps
vim.opt.undoreload = 10000 -- lines to save for reload
vim.opt.smartindent = false -- inbuilt smart indent control
vim.opt.showtabline = 1 -- 0 never show, 1 show when multiple tabs, 2 always show
vim.opt.backspace = "indent,eol,start" -- allow backspace for indents and start/end of lines
vim.opt.pumheight = 10 -- set popup menu height
vim.opt.conceallevel = 0 -- make markdown text symbols visible
vim.opt.signcolumn = "yes:1" -- keep sign column
vim.opt.fileencoding = "utf-8" -- default file encoding
vim.opt.cmdheight = 1 -- height of command line in editor
vim.opt.breakindent = true -- wrapped lines will match indent of original line
vim.opt.updatetime = 250 -- wait time for neovim to fire certain events
vim.opt.timeoutlen = 300 -- wait time to complete mapped sequence
vim.opt.completeopt = "menuone,noselect" -- show completion even for one item, don't auto insert
vim.opt.shortmess:append "c" -- suppress completion messages for quieter UI
vim.opt.iskeyword:append "-" -- treat hyphenated words as one word
vim.opt.formatoptions:remove {"c", "r", "o"} -- don't insert auto comments on newlines and textwrap etc.
vim.opt.runtimepath:remove "/usr/share/vim/vimfiles" -- remove vim plugins from neovim path
vim.opt.hidden = true -- allow buffer switching without saving 
vim.opt.confirm = true -- ask what to do instead of erroring when closing with unsaved changes
vim.opt.autoread = true -- auto-reload files changed on disk (works with checktime)
vim.opt.equalalways = true -- keep splits balanced when opening and closing
vim.opt.incsearch = true -- show matches as search is typed
vim.opt.inccommand = "split" -- live preview for :substitute 
vim.opt.smarttab = true -- tab line at start uses shiftwidth to correctly indent
vim.opt.shiftround = true -- restrict to multiples of shiftwidth
vim.opt.smoothscroll = true -- smooth scolling if version supports it
vim.opt.laststatus = 2 -- always show statusline (maybe not useful if lualine for example)
vim.opt.pumblend = 0 -- no transparancy for popup menus
vim.opt.winblend = 0 -- no transparency for floating windows




-- test
