return {
  -- Fermeture automatique des parenthèses, crochets, guillemets
  {
    'm4xshen/autoclose.nvim',
    event = 'InsertEnter',
    config = function()
      require('autoclose').setup {
        keys = {
          ['('] = { escape = false, close = true, pair = '()' },
          ['['] = { escape = false, close = true, pair = '[]' },
          ['{'] = { escape = false, close = true, pair = '{}' },
          ['"'] = { escape = true, close = true, pair = '""' },
          ["'"] = { escape = true, close = true, pair = "''" },
          ['`'] = { escape = true, close = true, pair = '``' },
        },
        options = {
          disabled_filetypes = { 'text' },
          disable_when_touch = false,
          touch_regex = '[%w(%[{]',
          pair_spaces = true,
          auto_indent = true,
        },
      }

      -- Enter entre {} [] () crée une ligne indentée au milieu
      vim.keymap.set('i', '<CR>', function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local before = line:sub(col, col)
        local after = line:sub(col + 1, col + 1)

        local pairs = { ['{'] = '}', ['['] = ']', ['('] = ')' }
        if pairs[before] == after then
          return '<CR><Esc>O'
        end
        return '<CR>'
      end, { expr = true, noremap = true })
    end,
  },

  -- Fermeture automatique des balises HTML/JSX avec Treesitter
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },
}
