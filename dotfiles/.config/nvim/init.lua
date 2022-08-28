-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

local packer = require 'packer'
packer.init()
packer.reset()

packer.use 'wbthomason/packer.nvim'

if packer_bootstrap then
  packer.sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/* source <afile> | PackerCompile
  augroup end
]])

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
mapSilent('n', '<Leader>s', ':w<CR>')
mapSilent('i', '<Leader>s', '<ESC>:w<CR>')

-- Quit
mapSilent('n', '<Leader>q', ':q<CR>')
mapSilent('i', '<Leader>q', '<ESC>:q<CR>')

-- Splits
mapSilent('n', '<Leader>o', ':vsplit<CR>')
mapSilent('i', '<Leader>o', '<ESC>:vsplit<CR>')
mapSilent('n', '<C-h>', '<C-w><C-h>')
mapSilent('n', '<C-l>', '<C-w><C-l>')
mapSilent('n', '<Leader>e', '<C-w>=')
mapSilent('n', '<Leader>f', '<C-w>|')

-- Tabs
mapSilent('n', '<Leader>t', ':tabnew<CR>')
mapSilent('i', '<Leader>t', '<ESC>:tabnew<CR>')
mapSilent('n', '<Leader>tn', ':tabn<CR>')
mapSilent('i', '<Leader>tn', '<ESC>:tabn<CR>')
mapSilent('n', '<Leader>tp', ':tabp<CR>')
mapSilent('i', '<Leader>tp', '<ESC>:tabp<CR>')

