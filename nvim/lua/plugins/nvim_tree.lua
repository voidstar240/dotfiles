return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            renderer = {
                group_empty = false,
                special_files = {
                    "Cargo.toml",
                    "Makefile",
                    "README.md",
                    "readme.md",
                },
                indent_markers = { enable = true },
            },
            filters = {
                git_ignored = true, -- hide files that are git ignored
                dotfiles = false, -- hide dot files
                git_clean = false, -- hide the files with no git status
                no_buffer = false, -- hide files that are not being edited
                custom = { "^\\.git$" }, -- regex for files to hide
                exclude = {},
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            view = {
                float = {
                    enable = true,
                    quit_on_focus_loss = true,
                    open_win_config = function()
                        local row = 1
                        local width = 40
                        local height = vim.o.lines - row * 2 - 1
                        local col = vim.o.columns - width - 2
                        if col > 80 + vim.o.numberwidth + 4 then
                            col = 80 + vim.o.numberwidth + 4
                        end
                        return {
                            relative = "editor",
                            border = "rounded",
                            row = row,
                            col = col,
                            height = height - 2,
                            width = width - 2,
                        }
                    end,
                },
            },
        }
    end
}

