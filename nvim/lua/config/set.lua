-- disable netrw (use nvim-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true                -- shows the line number column

vim.opt.tabstop = 4              -- number of spaces per tab
vim.opt.softtabstop = 0          -- number of spaces per tab during editing
vim.opt.shiftwidth = 0           -- number of spaces to use for auto indent
vim.opt.expandtab = true         -- insert spaces instead of tabs

vim.opt.autoindent = true        -- match indentation to preceding line
vim.opt.smartindent = true       -- extra rules to govern the above

vim.opt.wrap = false             -- text wrapping

vim.opt.swapfile = false         -- do not write a swapfile for buffer
vim.opt.backup = false           -- do not backup buffer

vim.opt.hlsearch = false         -- do not highlight search
vim.opt.incsearch = true         -- search while typing the query

vim.opt.termguicolors = true     -- enables 24-bit color

vim.opt.scrolloff = 8            -- number of lines between top/bottom of screen and cursor
vim.opt.signcolumn = "yes"       -- column to left of line num for signs (breakpoint/error/warning)
vim.opt.colorcolumn = "81"       -- draw column at 80 characters

vim.opt.isfname:append("@-@")    -- allow @ in file names

vim.opt.timeout = true           -- allow key presses to timeout
vim.opt.timeoutlen = 1000        -- pressed keys timeout after 1000 ms

vim.opt.cmdheight = 0            -- hide the command line

vim.opt.list = true
vim.opt.listchars = { tab = "▸  " } -- use triangle to identify tab characters
