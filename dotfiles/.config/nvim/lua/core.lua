function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
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
vim.opt.cursorline = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- Save
mapSilent('n', '<leader>s', ':w<CR>')
mapSilent('i', '<leader>s', '<ESC>:w<CR>')

-- Quit
mapSilent('n', '<leader>q', ':q<CR>')
mapSilent('i', '<leader>q', '<ESC>:q<CR>')

-- Splits
mapSilent('n', '<leader>o', ':vsplit<CR>')
mapSilent('i', '<leader>o', '<ESC>:vsplit<CR>')
mapSilent('n', '<C-h>', '<C-w><C-h>')
mapSilent('n', '<C-l>', '<C-w><C-l>')
mapSilent('n', '<leader>e', '<C-w>=')
mapSilent('n', '<leader>f', '<C-w>|')

-- Tabs
mapSilent('n', '<leader>t', ':tabnew<CR>')
mapSilent('i', '<leader>t', '<ESC>:tabnew<CR>')
mapSilent('n', '<leader>tn', ':tabn<CR>')
mapSilent('i', '<leader>tn', '<ESC>:tabn<CR>')
mapSilent('n', '<leader>tp', ':tabp<CR>')
mapSilent('i', '<leader>tp', '<ESC>:tabp<CR>')

