-- Affiche le Markdown mis en forme directement dans le tampon (titres, tableaux, listes,
-- blocs de code). Le texte brut réapparaît sur la ligne du curseur pour l'éditer.
-- Commande : :RenderMarkdown toggle
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = { 'markdown' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
