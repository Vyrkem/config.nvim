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
--telescope
vim.keymap.set('n', '<leader>sg', function()
	require('telescope.builtin').live_grep() end,{ desc = 'Live grep' })
vim.keymap.set('n', '<leader>sw', function()
	require('telescope.builtin').grep_string() end, { desc = 'grep mot selectioner' })

-- C : prototypes <-> définitions (commandes dans custom/core/commands.lua)
vim.keymap.set('v', '<leader>ci', ':Implementer<CR>', { silent = true, desc = '[C] [I]mplémenter les prototypes' })
vim.keymap.set('v', '<leader>cp', ':Prototyper<CR>', { silent = true, desc = '[C] [P]rototyper les définitions' })
vim.keymap.set('n', '<leader>cP', '<cmd>Prototypes<CR>', { desc = '[C] copier tous les [P]rototypes du fichier' })
