set langmenu=en_US.UTF-8
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'https://github.com/adamheins/vim-highlight-match-under-cursor'
Plug 'https://github.com/preservim/vimux'
Plug 'bagrat/vim-buffet' " tabs
Plug 'voldikss/vim-floaterm'
Plug 'https://github.com/RRethy/vim-illuminate.git'
Plug 'https://github.com/jszakmeister/vim-togglecursor'
Plug 'https://github.com/machakann/vim-highlightedyank'
call plug#end()

let g:highlightedyank_highlight_duration = 300
let NERDTreeShowHidden=1
"nnoremap <SPACE> <Nop>
let mapleader =" "
syntax on
syntax enable
set autoindent
"set expandtab
set hlsearch
set incsearch
set noerrorbells
set novisualbell
set nowrapscan
set number
set shiftwidth=4
set belloff=all
set tabstop=4
set updatetime=200
filetype on

":set termguicolors " colors
set hlsearch
set number
set list
set listchars=tab:⇤–⇥,space:·,trail:·,precedes:⇠,extends:⇢,nbsp:×,eol:↴
set mouse=v
"set clipboard=autoselect,autoselectplus
set clipboard=unnamedplus
set statusline+=%F
set laststatus=2
set hlsearch
set timeoutlen=1000 ttimeoutlen=0
colo industry
"colo habamax
"colo peachpuff
highlight Cursorline cterm=bold
highlight OverLength ctermbg=DarkGreen ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.\+/
":set cursorline
":hi CursorLine ctermbg=black term=none cterm=none
" set cursorline
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

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

"mark a line
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" press ' to delete to blackhole
noremap ' "_
nnoremap 'd "_dd
xnoremap 'd "_dd
" map x to delete to blackhole
nnoremap x "_x
xnoremap x "_x
nnoremap X "_X
xnoremap X "_X

"highligh edit mode
au InsertEnter * set cul
au InsertLeave * set nocul

":hi cursorlinenr guifg=#af00af
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight LineNr ctermfg=NONE ctermbg=NONE ctermfg=grey
set cursorline
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
"mode lin up and down
noremap <c-s-up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-down> ddp
let NERDTreeQuitOnOpen=1
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
let NERDTreeMapOpenInTab='<TAB>'
let NERDTreeMapOpenInTabSilent='<ENTER>'
let g:NERDTreeMapActivateNode = 'v'
let g:NERDTreeMapPreview = 'o'

