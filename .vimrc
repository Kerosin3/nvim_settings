call plug#begin()
Plug 'preservim/nerdtree'
Plug 'https://github.com/adamheins/vim-highlight-match-under-cursor'
Plug 'https://github.com/preservim/vimux'
Plug 'bagrat/vim-buffet' " tabs
Plug 'voldikss/vim-floaterm'
call plug#end()

"nnoremap <SPACE> <Nop>
let mapleader =" "

syntax on
syntax enable
set autoindent
set expandtab
set hlsearch
set incsearch
set noerrorbells
set novisualbell
set nowrapscan
set number
set shiftwidth=4
set t_vb=
set tabstop=4
set updatetime=200
filetype on

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
map <leader>s <cmd>exe "%s/\\v\<" .. expand("<cword>") .. ">/" .. input("Replace \"" .. expand("<cword>") .. "\" by? ") .. "/g"<cr>
inoremap jj <ESC>
map <C-s> :write<CR>

let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
"find under cursor
nnoremap <c-w> * :let @/ = "\\<<C-r><C-w>\\>"<cr>:set hlsearch<cr>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-l> gt "next line
nnoremap <C-h> gT "previous line
let NERDTreeMapOpenInTab='<ENTER>'
"exit tree when open
let NERDTreeQuitOnOpen=1
"press V to open dir node
let NERDTreeMapActivateNode='v'

let g:buffet_show_index = 1

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
" noremap <C-t> :tabnew split<CR>
" terminal
let g:floaterm_autoclose = 1
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_keymap_kill   = '<F11>'
" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan

" press ' to delete to blackhole
noremap ' "_
nnoremap 'd "_dd
xnoremap 'd "_dd
" map x to delete to blackhole
nnoremap x "_x
xnoremap x "_x
nnoremap X "_X
xnoremap X "_X
