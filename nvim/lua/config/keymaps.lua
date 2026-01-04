-- set <Space> leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open netrw (uncomment if using netrw)
-- vim.keymap.set("n", "<Leader>vf", vim.cmd.Ex, { desc = "[V]iew [F]iles" })
vim.keymap.set("n", "<Leader>vf", vim.cmd.NvimTreeOpen, { desc = "[V]iew [F]iles" })

-- unbind macro commands
vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set({ "n", "v" }, "q", "<Nop>")
vim.keymap.set({ "n", "v" }, "<C-Q>", "q", { desc = "Start/Stop recording macro" })

-- copy and paste from system clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>P", "\"+p", { desc = "[P]aste from system clipboard" })

-- center cursor during searches
vim.keymap.set("n", "n", "nzzzv", { desc = "Go to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to prev search result" })

-- move half page up/down
vim.keymap.set("n", "J", "10j", { desc = "Move cursor half page down" })
vim.keymap.set("n", "K", "10k", { desc = "Move cursor half page up" })

-- move cursor to start and end of line
vim.keymap.set({ "n", "v" }, "H", "0^", { desc = "Move cursor to start of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Move cursor to end of line" })

-- move selection up/down and smart indent it
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- LSP keymaps
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "[G]o to [D]efinition" })
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "[G]o to [D]eclaration" })
vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, { desc = "[G]o to [T]ype definition" })
vim.keymap.set("n", "<Leader><Leader>", function() vim.lsp.buf.hover() end, { desc = "View hover documentation" })
vim.keymap.set("n", "<Leader>d", function() vim.diagnostic.jump({ count =  1 }) end, { desc = "Next [D]iagnostic"})
vim.keymap.set("n", "<Leader>D", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous [D]iagnostic" })
vim.keymap.set("n", "<Leader>ss", function() vim.lsp.buf.workspace_symbol() end, { desc = "[S]earch [S]ymbol" })
vim.keymap.set("n", "<Leader>ca", function() vim.lsp.buf.code_action() end, { desc = "[C]ode [A]ctions" })
vim.keymap.set("n", "<Leader>rr", function() vim.lsp.buf.references() end, { desc = "View [R]eferences" })
vim.keymap.set("n", "<Leader>rn", function() vim.lsp.buf.rename() end, { desc = "[R]e[N]ame Symbol" })
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Signature [H]elp" })
vim.keymap.set("i", "<C-j>", function()
    if vim.fn.pumvisible() == 0 then
        vim.lsp.completion.get()
    else
        local key = vim.api.nvim_replace_termcodes("<C-e>", true, false, true)
        vim.api.nvim_feedkeys(key, "n", false)
    end
end, { desc = "Completion Menu" })
