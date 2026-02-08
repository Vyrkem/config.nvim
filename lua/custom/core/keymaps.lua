-- Sauvegarder avec Ctrl+S (et sortir du mode insert/visual)
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>', { silent = true })
vim.keymap.set('v', '<C-s>', '<ESC>:w<CR>', { silent = true })

-- Sortir du mode insert avec jk (alternative à ESC)
vim.keymap.set('i', 'jk', '<ESC>', { silent = true })

--changer de fenetre dans nvim quand utiliser vsplit
vim.keymap.set('n', '<C-Left>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { silent = true })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { silent = true })
