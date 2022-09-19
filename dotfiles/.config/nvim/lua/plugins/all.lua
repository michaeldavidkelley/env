require('packer').use {
  'stevearc/dressing.nvim',
}
-- CMP
require('packer').use {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
  },
  config = function ()
    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          col_offset = -1,
          side_padding = 1,
          winhighlight = 'Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSelection,Search:None',
        }),
        documentation = cmp.config.window.bordered({
          side_padding = 1,
          winhighlight = 'FloatBorder:CmpBorder',
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
      }),
      formatting = {
        format = require('lspkind').cmp_format({
          mode = 'symbol_text',
          preset = 'codicons',
          menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            nvim_lsp_signature_help = "[LSP Sig]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
          })
        })
      }
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'nvim_lsp_document_symbol' },
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
          { name = 'cmdline' }
        })
    })
  end
}

-- LSP
require('packer').use {
  'williamboman/mason.nvim',
  after = 'nvim-lspconfig',
  config = function ()
    require('mason').setup()
  end
}

require('packer').use {
  'williamboman/mason-lspconfig.nvim',
  after = { 'nvim-lspconfig', 'mason.nvim' },
  config = function ()
    require('mason-lspconfig').setup()
  end
}

require('packer').use {
  'neovim/nvim-lspconfig',
  requires = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local signs = { Error = '‼', Warn = '!', Hint = '?', Info = '*' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl })
    end

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = 'rounded',
    })

    local function with_desc(opts, desc)
      return vim.tbl_extend('force', opts, { desc = desc })
    end

    local on_attach = function(_, bufnr)
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
    end

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    require('lspconfig')['gopls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end
}
-- END LSP

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
