return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local gruvbox = require("gruvbox")
        local p = gruvbox.palette
        gruvbox.setup({
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {
                SignColumn = { bg = p.dark0 },
                NormalFloat = { bg = p.dark0 },
                NvimTreeGitDirty = { fg = p.neutral_red },
                NvimTreeGitStaged = { fg = p.neutral_green },
                NvimTreeIndentMarker = { fg = p.dark2 },
                MsgArea = { bg = p.dark0 },
                ExtraWhitespace = { bg = p.bright_red },
            }
        })
        vim.opt.background = "dark"
        vim.cmd("colorscheme gruvbox")

        -- Transparency
        vim.cmd("highlight Normal guibg=none")
        vim.cmd("highlight NonText guibg=none")
        vim.cmd("highlight SignColumn guibg=none")
        vim.cmd("highlight ColorColumn guifg=#504945")
        vim.cmd("highlight NormalFloat guibg=none")
        vim.cmd("highlight FloatBorder guibg=none")
    end
}
