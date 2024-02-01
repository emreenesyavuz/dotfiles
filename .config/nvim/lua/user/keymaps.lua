-- Bind options
local bind = vim.keymap.set

 -- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ESC to swich Normal mode in Terminal
bind('t', '<Esc>', '<C-\\><C-n>')

-- NvimTree Toggle
bind('n', '<Leader>,', ':NvimTreeToggle<CR>')

-- Goto previous buffer
bind('n', 'gp', ':b#<CR>')

-- Update the file
bind('n', '<Leader>u', ':update<CR>')

-- Map o and O to newline without insert
bind('n', 'o', 'o<Esc>')
bind('n', 'O', 'O<Esc>')

-- <F3> to remove highlight of search
bind('n', '<F3>', ':set hlsearch!<CR>')

-- For REPL TODO: Make them file specific
vim.cmd('nmap <Leader>q vapR<Esc>j')
vim.cmd('nmap <Leader>a vapR<Esc>{j')
vim.cmd('nmap <Leader>z vafR<Esc>{j')
vim.cmd('nmap <Leader>w viwR<Esc>')
vim.cmd('nmap <Leader>su VggR<Esc><C-o>')

vim.cmd[[autocmd FileType r inoremap <C-D> <Esc>A %>%<Enter>]]
vim.cmd[[autocmd FileType r imap <C-E> <Esc>A %>%]]


-- Terminal 
bind('n', '<Leader>t', ':vsp term://zsh<CR>')

-- <F8> to remove highlight of search
bind('n', '<F8>', ':Vista!!<CR>')

