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
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true
        }
      }
    })

    local function project_files()
      local opts = {}
      local ok = pcall(require('telescope.builtin').git_files, opts)
      if not ok then require('telescope.builtin').find_files(opts) end
    end

    vim.keymap.set('n', '<leader>ff', project_files, { desc = 'Open project file' })
    vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Search for string' })
  end
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
