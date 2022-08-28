function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function mapSilent(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  map(mode, lhs, rhs, opts)
end

vim.g.mapleader = ';'

vim.opt.mouse = 'a'
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.listchars = { tab = '» ', trail = '·' }

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

mapSilent('n', '<Leader>s', ':w<CR>')
mapSilent('n', '<Leader><Leader>', '<ESC>')
