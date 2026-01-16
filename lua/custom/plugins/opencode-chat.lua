return {
  {
    'sudo-tee/opencode.nvim',
    config = function()
      require('opencode').setup {}

      vim.keymap.set('n', '<leader>aa', '<cmd>OpenCode<CR>', { desc = 'OpenCode: Chat' })
      vim.keymap.set('v', '<leader>aa', '<cmd>OpenCode<CR>', { desc = 'OpenCode: Chat (selection)' })
    end,
  },
}
