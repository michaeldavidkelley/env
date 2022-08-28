function map(mode, keys, mapTo, opts)
    local = options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, keys, mapTo, options)
end

vim.g.mapleader = ';'

vim.opt.swapfile = false
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
