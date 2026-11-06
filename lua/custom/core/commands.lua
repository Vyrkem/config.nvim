-- Commandes C : prototypes (.h) <-> définitions (.c)
-- Les résultats sont écrits dans le fichier jumeau (foo.h <-> foo.c), pas dans le fichier courant.

-- Ouvre le fichier jumeau (.h -> .c, .c -> .h) et retourne son numéro de buffer
local function ouvrir_jumeau(ext_voulue)
  local chemin = vim.api.nvim_buf_get_name(0)
  local jumeau = chemin:gsub('%.[ch]$', '.' .. ext_voulue)
  if jumeau == chemin then
    vim.notify('Pas un fichier .c ou .h', vim.log.levels.ERROR)
    return nil
  end
  vim.cmd.edit(vim.fn.fnameescape(jumeau))
  return vim.api.nvim_get_current_buf()
end

-- Prototypes sélectionnés dans le .h -> corps vides ajoutés à la fin du .c
vim.api.nvim_create_user_command('Implementer', function(opts)
  local source = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
  local defs, courant = {}, {}
  for _, ligne in ipairs(source) do
    local fin_sig = ligne:match '^(.-)%s*;%s*$'
    if fin_sig then
      -- fin du prototype (il peut s'étaler sur plusieurs lignes) : on l'émet en entier
      table.insert(courant, fin_sig .. ' {')
      table.insert(defs, '')
      vim.list_extend(defs, courant)
      table.insert(defs, '}')
      courant = {}
    elseif ligne:match '%S' then
      table.insert(courant, ligne) -- ligne de début d'un prototype multi-lignes
    end
  end
  if #defs == 0 then
    return vim.notify('Aucun prototype dans la sélection', vim.log.levels.WARN)
  end

  local buf = ouvrir_jumeau 'c'
  if not buf then return end
  local fin = vim.api.nvim_buf_line_count(buf)
  vim.api.nvim_buf_set_lines(buf, fin, fin, false, defs)
  vim.api.nvim_win_set_cursor(0, { fin + 2, 0 })
end, { range = true, desc = 'Prototypes .h -> corps vides dans le .c' })

-- Définitions sélectionnées dans le .c -> prototypes ajoutés au .h (avant le #endif)
vim.api.nvim_create_user_command('Prototyper', function(opts)
  local source = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
  local protos = {}
  for _, ligne in ipairs(source) do
    local sig = ligne:match '^([%a_][^;]-%))%s*{%s*$'
    if sig then table.insert(protos, sig .. ';') end
  end
  if #protos == 0 then
    return vim.notify('Aucune signature de fonction dans la sélection', vim.log.levels.WARN)
  end

  local buf = ouvrir_jumeau 'h'
  if not buf then return end
  local lignes = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  -- insérer avant le dernier #endif (garde d'inclusion), sinon à la fin
  local pos = #lignes
  for i = #lignes, 1, -1 do
    if lignes[i]:match '^%s*#endif' then
      pos = i - 1
      break
    end
  end
  vim.api.nvim_buf_set_lines(buf, pos, pos, false, protos)
  vim.api.nvim_win_set_cursor(0, { pos + 1, 0 })
end, { range = true, desc = 'Définitions .c -> prototypes dans le .h' })

-- Copie les prototypes de toutes les fonctions du fichier dans le registre "
vim.api.nvim_create_user_command('Prototypes', function()
  local protos = {}
  for _, ligne in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    local sig = ligne:match '^([%a_][^;]-%))%s*{%s*$'
    if sig then table.insert(protos, sig .. ';') end
  end
  vim.fn.setreg('"', protos, 'l')
  print(#protos .. ' prototype(s) copié(s)')
end, { desc = 'Copier les prototypes du fichier C' })
