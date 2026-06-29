return {
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'pyright',
        'clangd',
        'rust-analyzer',
        'zls',
        'slint-lsp',
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Neovim 0.11+ : utilise vim.lsp.config au lieu de require('lspconfig')
      vim.lsp.config('pyright', {})
      vim.lsp.config('clangd', {})
      vim.lsp.config('zls', {})
      vim.lsp.config('slint_lsp', {})
      -- rust_analyzer géré par rustaceanvim
      vim.lsp.config('svlangserver', {})
      vim.lsp.config('verible', {
        on_attach = function(client)
          client.server_capabilities.diagnosticProvider = nil
        end,
      })

      vim.lsp.enable({ 'pyright', 'clangd', 'zls', 'slint_lsp', 'svlangserver', 'verible' })

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = false,
        virtual_lines = { current_line = true },
      }
    end,
  },
}
