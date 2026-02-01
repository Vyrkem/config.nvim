return {
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'pyright',
        'clangd',
        'rust-analyzer',
        'zls',
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
      -- rust_analyzer géré par rustaceanvim

      vim.lsp.enable({ 'pyright', 'clangd', 'zls' })
    end,
  },
}
