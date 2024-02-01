-- Modified: Wed 17 Jan 2024 08:04:47 AM CST

local set = vim.opt

-- Spell Check in English
set.spelllang = "en"
-- Show at most 9 spell suggestion
set.spellsuggest = "best, 9"
-- Dictionary for spell check
set.dictionary:append('/usr/share/dict/words')


-- Cursorline
set.cursorline = true

-- Relative Line numbers
set.rnu = true
set.nu = true

-- Tab stop
set.tabstop = 4    
set.shiftwidth = 4   
set.softtabstop = 4  
set.expandtab = true

vim.cmd[[autocmd FileType r set tabstop=2 shiftwidth=2]]

-- Split Behavior
set.splitbelow = true
set.splitright = true

-- Colorscheme
-- Lua
require('onedark').setup {
   style = 'warmer'
}
require('onedark').load()

-- Do not show mode in statusline because it is already in Lualine
set.showmode = false

-- Enable GUI Colors
set.termguicolors = true

-- Folding with treesitter
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- Autoformat after saving
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({timeout_ms = 10000})]]

vim.cmd([[
" autocmd! BufWritePre * :call s:timestamp()

" to update timestamp when saving if its in the first 20 lines of a file
function! Timestamp()
let pat = '\(\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\).*'
let rep = '\1' . strftime("%a %d %b %Y %I:%M:%S %p %Z")
call Subst(1, 20, pat, rep)
endfunction

function! Subst(start, end, pat, rep)
let lineno = a:start
while lineno <= a:end
let curline = getline(lineno)
if match(curline, a:pat) != -1
let newline = substitute( curline, a:pat, a:rep, '' )
if( newline != curline )
" Only substitute if we made a change
"silent! undojoin
keepjumps call setline(lineno, newline)
endif
endif
let lineno = lineno + 1
endwhile
endfunction]])

local modifiedtime = vim.api.nvim_create_augroup("LastModifiedTime", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
command = "call Timestamp()",
group = modifiedtime,
})
