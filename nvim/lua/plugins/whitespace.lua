return {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    config = function ()
        vim.keymap.set("n", "<Leader>sw", vim.cmd.StripWhitespace, { desc = "[S]trip [W]hitespace" })
    end
}
