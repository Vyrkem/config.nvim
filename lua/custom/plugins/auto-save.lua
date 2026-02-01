return {
  'pocco81/auto-save.nvim',
  event = 'InsertLeave',
  config = function()
    require('auto-save').setup {
      enabled = true,
      trigger_events = { 'InsertLeave' },
      write_all_buffers = false,
      debounce_delay = 135,
      condition = function(buf)
        local fn = vim.fn
        local utils = require 'auto-save.utils.data'

        if fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbufvar(buf, '&filetype'), {}) then
          return true
        end
        return false
      end,
    }
  end,
}
