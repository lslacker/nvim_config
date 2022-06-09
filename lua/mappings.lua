vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- sane regexes
-- nmap('/', '/\\v')
-- vmap('/', '/\\v')

-- don't jump when using *
nmap('*', '*<c-o>')

-- keep search matches in the middle of the window
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Same when jumping around
nmap('g;', 'g;zz')
--nmap('g', 'g,zz') -- for some reason doesn't work well

-- Open a Quickfix window for the last search.
nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Begining & End of line in Normal mode
nmap('H', '^')
nmap('L', 'g_')

-- more natural movement with wrap on
nmap('j', 'gj')
nmap('k', 'gk')
vmap('j', 'gj')
vmap('k', 'gk')

-- Easy buffer navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Reselect visual block after indent/outdent
vmap('<', '<gv')
vmap('>', '>gv')

-- Terminal
-- ESC to go to normal mode in terminal
tmap('<C-s>', '<C-\\><C-n>')
tmap('<Esc><Esc>', '<C-\\><C-n>')

-- Easy window split; C-w v -> vv, C-w - s -> ss
nmap('vv', '<C-w>v')
nmap('ss', '<C-w>s')
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, mnove coursor to right pane

-- PLUGINS

-- Find files using Telescope command-line sugar.
nmap("<C-p>", "<cmd>Telescope find_files<cr>")
nmap("<leader>f", "<cmd>Telescope live_grep<cr>")
nmap("<leader>bb", "<cmd>Telescope buffers<cr>")
nmap("<leader>hh", "<cmd>Telescope help_tags<cr>")

-- LSP
vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
-- vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

nmap("ld", ":LspDef<CR>")
nmap("lr", ":LspRename<CR>")
nmap("ly", ":LspTypeDef<CR>")
nmap("[a", ":LspDiagPrev<CR>")
nmap("]a", ":LspDiagNext<CR>")
nmap("ga", ":LspCodeAction<CR>")
nmap("lf", ":LspFormatting<CR>")
nmap("<Leader>a", ":LspDiagLine<CR>")
imap("<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

-- LSP Saga
nmap('K', '<cmd>Lspsaga hover_doc<cr>')
imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')


-- File Explorer
nmap("<C-n>", ":NvimTreeToggle<CR>")
nmap("<leader>r", ":NvimTreeRefresh<CR>")
nmap("<leader>n", ":NvimTreeFindFile<CR>")

-- Trouble
nmap("<leader>xx", "<cmd>Trouble<cr>")
nmap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
nmap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
nmap("<leader>xl", "<cmd>Trouble loclist<cr>")
nmap("<leader>xq", "<cmd>Trouble quickfix<cr>")
nmap("gR", "<cmd>Trouble lsp_references<cr>")

-- Tmux-navigator
nmap("<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>")
nmap("<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>")
nmap("<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>")
nmap("<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>")
-- nmap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>")
-- nmap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>")