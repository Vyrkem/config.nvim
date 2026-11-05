-- Aperçu du Markdown dans le navigateur, mis à jour pendant qu'on tape.
-- Affiche aussi les diagrammes Mermaid, que render-markdown.nvim ne dessine pas.
-- Raccourci : <espace>mp (ou :MarkdownPreviewToggle)
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  -- Télécharge le serveur déjà compilé : pas besoin de npm ni de yarn.
  -- (Un script shell plutôt que mkdp#util#install(), qui n'existe pas encore
  -- au moment du build puisque le plugin ne se charge que pour le Markdown.)
  build = 'cd app && ./install.sh',
  keys = {
    { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', ft = 'markdown', desc = '[M]arkdown [P]review dans le navigateur' },
  },
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_auto_close = 1 -- ferme l'onglet quand on quitte le tampon
    vim.g.mkdp_theme = 'dark'
  end,
}
