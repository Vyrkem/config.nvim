return {
  {
    'jaswdr/opencode-completion.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('opencode-completion').setup {}

      vim.keymap.set('i', '<C-Space>', '<cmd>OpenCodeComplete<CR>', {
        silent = true,
        desc = 'OpenCode: Complete',
      })
    end,
  },
}
