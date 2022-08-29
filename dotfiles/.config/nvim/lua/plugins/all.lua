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

require('packer').use {
  'nvim-treesitter/nvim-treesitter',
}

require('packer').use {
  'ray-x/go.nvim',
  requires = {'ray-x/guihua.lua'},
  config = function()
    require('go').setup()
  end
}
