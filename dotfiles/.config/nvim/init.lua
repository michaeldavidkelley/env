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


require('packer').use {
  'stevearc/dressing.nvim',
}

require('packer').use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end
}

require('packer').use {
  'nvim-telescope/telescope.nvim',
  requires = {'nvim-lua/plenary.nvim'},
}

require('packer').use {
  'nvim-telescope/telescope-fzf-native.nvim',
  requires = { 'nvim-telescope/telescope.nvim' },
  run = 'make',
  config = function()
    require('telescope').load_extension('fzf')
  end
}

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

