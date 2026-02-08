# Keymaps Neovim

> Leader key : `<Space>`

---

## General

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<C-s>` | n, i, v | Sauvegarder le fichier | `core/keymaps.lua` |
| `jk` | i | Sortir du mode insert (alt. ESC) | `core/keymaps.lua` |
| `<Esc>` | n | Effacer la recherche (nohlsearch) | `init.lua` |
| `<Esc><Esc>` | t | Sortir du mode terminal | `init.lua` |

---

## Navigation fenêtres / splits

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<C-Left>` | n | Aller à la fenêtre de gauche | `core/keymaps.lua` |
| `<C-Right>` | n | Aller à la fenêtre de droite | `core/keymaps.lua` |
| `<C-Down>` | n | Aller à la fenêtre du bas | `core/keymaps.lua` |
| `<C-Up>` | n | Aller à la fenêtre du haut | `core/keymaps.lua` |

---

## Tmux Navigator

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<C-h>` | n | Tmux / Nvim gauche | `tmux-navigator.lua` |
| `<C-j>` | n | Tmux / Nvim bas | `tmux-navigator.lua` |
| `<C-k>` | n | Tmux / Nvim haut | `tmux-navigator.lua` |
| `<C-l>` | n | Tmux / Nvim droite | `tmux-navigator.lua` |

---

## Telescope (recherche)

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<leader>sh` | n | Search Help | `init.lua` |
| `<leader>sk` | n | Search Keymaps | `init.lua` |
| `<leader>sf` | n | Search Files | `init.lua` |
| `<leader>ss` | n | Search Select (pickers Telescope) | `init.lua` |
| `<leader>sw` | n | Search current Word | `init.lua` |
| `<leader>sg` | n | Search by Grep | `init.lua` |
| `<leader>sd` | n | Search Diagnostics | `init.lua` |
| `<leader>sr` | n | Search Resume (reprendre dernière recherche) | `init.lua` |
| `<leader>s.` | n | Search Recent Files | `init.lua` |
| `<leader>sb` | n | Search Browser (file explorer) | `init.lua` |
| `<leader>sn` | n | Search Neovim config files | `init.lua` |
| `<leader>s/` | n | Live Grep dans les fichiers ouverts | `init.lua` |
| `<leader>/` | n | Fuzzy search dans le buffer courant | `init.lua` |
| `<leader><leader>` | n | Find existing buffers | `init.lua` |

---

## LSP (actif quand un serveur LSP est attaché)

### Navigation LSP (kickstart - init.lua)

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `grn` | n | LSP: Rename | `init.lua` |
| `gra` | n, x | LSP: Code Action | `init.lua` |
| `grr` | n | LSP: References (Telescope) | `init.lua` |
| `gri` | n | LSP: Implementation (Telescope) | `init.lua` |
| `grd` | n | LSP: Definition (Telescope) | `init.lua` |
| `grD` | n | LSP: Declaration | `init.lua` |
| `grt` | n | LSP: Type Definition (Telescope) | `init.lua` |
| `gO` | n | LSP: Document Symbols | `init.lua` |
| `gW` | n | LSP: Workspace Symbols | `init.lua` |
| `<leader>th` | n | Toggle Inlay Hints | `init.lua` |

---

## Diagnostics

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<leader>q` | n | Ouvrir la quickfix list des diagnostics | `init.lua` |
| `<leader>sd` | n | Search Diagnostics (Telescope) | `init.lua` |

---

## Rust (rustaceanvim)

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<leader>ca` | n | Rust Code Action (override LSP) | `rust.lua` |
| `<leader>rr` | n | Rust Runnables | `rust.lua` |
| `<leader>re` | n | Expand Macro | `rust.lua` |
| `K` | n | Rust Hover Actions (override LSP) | `rust.lua` |
| `<leader>rd` | n | Rust Render Diagnostic (overlay) | `rust.lua` |
| `<leader>rl` | n | Toggle Virtual Lines (diagnostics) | `rust.lua` |

---

## DAP (Debug Adapter Protocol)

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<F5>` | n | Continue | `dap/keymaps.lua` |
| `<F10>` | n | Step Over | `dap/keymaps.lua` |
| `<F11>` | n | Step Into | `dap/keymaps.lua` |
| `<F12>` | n | Step Out | `dap/keymaps.lua` |
| `<leader>db` | n | Toggle Breakpoint | `dap/keymaps.lua` |
| `<leader>dr` | n | Open REPL | `dap/keymaps.lua` |

---

## File Explorer

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `\` | n | NeoTree reveal / close | `neo-tree.lua` |

---

## Terminal (toggleterm)

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<C-\>` | n, i | Toggle terminal | `terminal.lua` |
| `<Esc>` | t | Sortir du mode terminal | `terminal.lua` |

---

## Autocompletion (blink.cmp - preset super-tab)

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<Tab>` | i | Accepter la completion / snippet suivant | blink.cmp |
| `<S-Tab>` | i | Snippet precedent | blink.cmp |
| `<C-Space>` | i | Ouvrir menu / docs | blink.cmp |
| `<C-n>` / `<Down>` | i | Item suivant | blink.cmp |
| `<C-p>` / `<Up>` | i | Item precedent | blink.cmp |
| `<C-e>` | i | Fermer le menu | blink.cmp |
| `<C-k>` | i | Toggle signature help | blink.cmp |

---

## OpenCode Completion

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<C-Space>` | i | OpenCode: Complete | `opencode-completion.lua` |

---

## Avante (AI)

| Commande | Action | Source |
|---|---|---|
| `:OpenCodeModels` | Selectionner le modele AI | `avante.lua` |

---

## Formatting (conform)

| Raccourci | Mode | Action | Source |
|---|---|---|---|
| `<leader>f` | n, v, x | Format buffer | `init.lua (conform)` |

---

## Mini.nvim (textobjects & surround)

### mini.ai (around/inside)

| Raccourci | Mode | Action |
|---|---|---|
| `va)` | n | Select Around parentheses |
| `vi)` | n | Select Inside parentheses |
| `yinq` | n | Yank Inside Next Quote |
| `ci'` | n | Change Inside quotes |

### mini.surround

| Raccourci | Mode | Action |
|---|---|---|
| `saiw)` | n | Surround Add Inner Word avec () |
| `sd'` | n | Surround Delete quotes |
| `sr)'` | n | Surround Replace ) par ' |

---

## Which-Key groupes

| Prefix | Groupe |
|---|---|
| `<leader>s` | [S]earch |
| `<leader>t` | [T]oggle |
| `<leader>h` | Git [H]unk (n, v) |
