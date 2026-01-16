return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        shading_factor = 2,
        persist_mode = true,
        close_on_exit = true,
        auto_scroll = true,
        direction = 'horizontal', -- optionnel, mais pratique
      }
      vim.api.nvim_create_autocmd('TermOpen', {
        pattern = '*',
        callback = function()
          -- En mode terminal, Esc = <C-\><C-n>
          vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { buffer = true, silent = true })
        end,
      })
    end,
  },
}
