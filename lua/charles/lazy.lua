local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
-- require("lazy").setup({{import = "charles.plugins.lsp"}, {import = "charles.plugins"}} , {
 require("lazy").setup({{import = "charles.plugins.coc"}, {import = "charles.plugins"}} , {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

vim.cmd("hi Normal guibg=NONE")
