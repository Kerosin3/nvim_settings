syntax on
syntax enable
":set termguicolors " colors
set hlsearch
set number
set list
set listchars=tab:⇤–⇥,space:·,trail:·,precedes:⇠,extends:⇢,nbsp:×,eol:↴
set mouse=a
set clipboard=autoselect,autoselectplus
set clipboard=unnamedplus
set statusline+=%F
set laststatus=2
set hlsearch
colo desert
highlight Cursorline cterm=bold
highlight OverLength ctermbg=DarkGreen ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.\+/
":set cursorline
":hi CursorLine ctermbg=black term=none cterm=none
set cursorline
":set cursorcolumn
" Default Colors for CursorLine
" highlight  CursorLine ctermbg=Gray ctermfg=None
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=None ctermfg=Red
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None
nnoremap <SPACE> <Nop>
let mapleader = " "
map <leader>s <cmd>exe "%s/\\v\<" .. expand("<cword>") .. ">/" .. input("Replace \"" .. expand("<cword>") .. "\" by? ") .. "/g"<cr>
inoremap jj <ESC>
map <C-s> :write<CR>
