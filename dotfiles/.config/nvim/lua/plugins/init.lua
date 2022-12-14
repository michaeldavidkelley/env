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
require 'plugins.all'


if packer_bootstrap then
  packer.sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/* source <afile> | PackerCompile
  augroup end
]])
