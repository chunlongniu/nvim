-- SCL LSP configuration for Neovim
-- Add this to your init.lua or source it from there

vim.opt.runtimepath:append(vim.fs.dirname(debug.getinfo(1, "S").source:sub(2)))

-- Register .scl filetype
vim.filetype.add({
        extension = {
                scl = "scl",
        },
})

-- Configure the LSP server
vim.api.nvim_create_autocmd("FileType", {
        pattern = "scl",
        callback = function()
                vim.lsp.start({
                        name = "rscl",
                        cmd = { "rscl" }, -- ensure the binary is in your PATH
                        -- root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]) or vim.fn.getcwd(),
                        root_dir = vim.fs.root(0, { ".git" }) or vim.fn.getcwd(),
                        capabilities = vim.lsp.protocol.make_client_capabilities(),
                })
        end,
})
