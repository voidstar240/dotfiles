vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true)
            },
            runtime = { version = "LuaJIT" },
            telemetry = { enable = false },
        }
    }
})

vim.lsp.config("clangd", {
    cmd = { "clangd", "--header-insertion=never" }
})

-- TODO give complete popup menu rounded border when PR #25541 is released
-- https://github.com/neovim/neovim/pull/25541
vim.opt.completeopt = "fuzzy,menu,noinsert,noselect,popup"
vim.diagnostic.config({ jump = { float = true }})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf,
                                      { autotrigger = false })
        end
        if not client:supports_method("completionItem/resolve") then
            return
        end
        local _, cancel_prev = nil, function() end
        vim.api.nvim_create_autocmd("CompleteChanged", {
            buffer = ev.buf,
            callback = function()
                cancel_prev()
                local info = vim.fn.complete_info({ "selected" })
                local completionItem = vim.tbl_get(vim.v.completed_item,
                                                   "user_data", "nvim", "lsp",
                                                   "completion_item")
                if not completionItem then
                    return
                end
                _, cancel_prev = vim.lsp.buf_request(ev.buf,
                    vim.lsp.protocol.Methods.completionItem_resolve,
                    completionItem,
                    function(err, item, ctx)
                        if not item then
                            return
                        end
                        local docs = (item.documentation or {}).value
                        local win = vim.api.nvim__complete_set(info["selected"],
                                                               { info = docs })
                        if win.winid and vim.api.nvim_win_is_valid(win.winid)
                        then
                            vim.treesitter.start(win.bufnr, "markdown")
                            vim.wo[win.winid].conceallevel = 3
                        end
                    end)
            end
        })
    end,
})

local pumMaps = {
    ["<Tab>"] =   "<C-n>",
    ["<S-Tab>"] = "<C-p>",
    ["<Down>"] =  "<C-n>",
    ["<Up>"] =    "<C-p>",
    ["<CR>"] =    "<C-y>",
}
for insertKmap, pumKmap in pairs(pumMaps) do
   vim.keymap.set("i", insertKmap, function()
       return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
   end, { expr = true })
end
