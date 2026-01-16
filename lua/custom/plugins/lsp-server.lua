return {
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'pyright',
        'clangd',
        'rust-analyzer',
        'zls',
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        pyright = {},
        clangd = {},
        rust_analyzer = {},
        zls = {},
      },
    },
  },
}
