return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended to avoid breaking changes
    lazy = false,   -- Plugin is already lazy-loaded on rust filetype
    ft = { 'rust' },
    init = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
          -- Inlay hints are now built into Neovim 0.10+
          -- Enable them globally or per-buffer with vim.lsp.inlay_hint.enable()
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set('n', '<leader>ca', function()
              vim.cmd.RustLsp('codeAction')
            end, vim.tbl_extend('force', opts, { desc = 'Rust Code Action' }))
            vim.keymap.set('n', '<leader>rr', function()
              vim.cmd.RustLsp('runnables')
            end, vim.tbl_extend('force', opts, { desc = 'Rust Runnables' }))
            vim.keymap.set('n', '<leader>re', function()
              vim.cmd.RustLsp('expandMacro')
            end, vim.tbl_extend('force', opts, { desc = 'Expand Macro' }))
            vim.keymap.set('n', 'K', function()
              vim.cmd.RustLsp({ 'hover', 'actions' })
            end, vim.tbl_extend('force', opts, { desc = 'Rust Hover Actions' }))
            vim.keymap.set('n', '<leader>rd', function()
              vim.cmd.RustLsp('renderDiagnostic')
            end, vim.tbl_extend('force', opts, { desc = 'Rust Render Diagnostic (overlay)' }))

            -- Toggle virtual lines pour les diagnostics (affichage sous les lignes)
            local virtual_lines_enabled = false
            vim.keymap.set('n', '<leader>rl', function()
              virtual_lines_enabled = not virtual_lines_enabled
              vim.diagnostic.config({
                virtual_lines = virtual_lines_enabled,
                virtual_text = not virtual_lines_enabled,
              })
              vim.notify('Diagnostic virtual lines: ' .. (virtual_lines_enabled and 'ON' or 'OFF'))
            end, vim.tbl_extend('force', opts, { desc = 'Toggle Diagnostic Virtual Lines' }))

            -- Enable inlay hints for this buffer
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end,
          default_settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = 'clippy',
              },
            },
          },
        },
      }
    end,
  },
}
