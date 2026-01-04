return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- INSTALL `tree-sitter-cli` IF PARSERS KEEP REINSTALLING!
        require("nvim-treesitter").setup({})
        require("nvim-treesitter").install({
            "bash",
            "c",
            "cmake",
            "cpp",
            "css",
            "diff",
            "dockerfile",
            "gitcommit",
            "gitignore",
            "glsl",
            "hlsl",
            "html",
            "ini",
            "javascript",
            "json",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "rust",
            "sql",
            "toml",
            "wgsl",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
            "zig",
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "*" },
            callback = function()
                local filetype = vim.bo.filetype
                if filetype and filetype ~= "" then
                    local success = pcall(function()
                        vim.treesitter.start()
                    end)
                    if not success then
                        return
                    end
                end
            end,
        })
    end
}
