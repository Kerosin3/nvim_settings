"let g:mapleader = "<Space>"
nnoremap <SPACE> <Nop>
let mapleader = " "
call plug#begin('~/.config/nvim/plugged')
Plug 'tyru/open-browser.vim' " opens url in browser
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
"Plug 'https://github.com/vim-airline/vim-airline'
"Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'rakr/vim-one'
Plug 'sickill/vim-monokai'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'frazrepo/vim-rainbow'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'https://github.com/cdelledonne/vim-cmake'
Plug 'Yggdroot/indentLine'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'cljoly/telescope-repo.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'rust-lang/rust.vim'
Plug 'pearofducks/ansible-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'https://github.com/mg979/docgen.vim' DOGE instead
Plug 'https://github.com/adamheins/vim-highlight-match-under-cursor'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'petertriho/nvim-scrollbar'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'kylechui/nvim-surround'
Plug 'itchyny/lightline.vim'
Plug 'kdheepak/tabline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ellisonleao/glow.nvim'
"Plug 'folke/trouble.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
"Plug 'dense-analysis/ale'
call plug#end()
"KEYBINDINGS
"[] jumps between code blocks
"bindings!-----------------
"[[ - go next block
" C-k  C-j  insert line below\above
" A-j  A-k   mode line above\below
" Leader - d   - insert docs
autocmd ColorScheme *
      \ hi CocUnusedHighlight ctermbg=NONE guibg=#94FFB9 guifg=#D433FF
au FileType c,cpp,objc,objcpp,rs call rainbow#load()
 let g:rainbow_guifgs = ['aquamarine', 'chocolate1', 'plum1', 'darkseagreen1']
let g:rainbow_active = 1
:lua require("scrollbar-config")
:lua require("tokio-night-config")
:lua require("nvim-tree-config")
:lua require("indent-blankline-config")
:lua require("telescope-config")
:lua require("nvim-surround")
:lua require("toggleterm_config")
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <C-\> :ToggleTerm direction=horizontal size=17 start_in_insert=true close_on_exit=true<CR>
nnoremap <C-]> :ToggleTerm direction=float start_in_insert=true close_on_exit=true<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
"press \\ to exit

"colorscheme monokai
" Vim Script
"let g:tokyonight_style = 'night'
"' ]
" Vim Script
"colorscheme tokyonight
" There are also colorschemes for the different styles
"colorscheme tokyonight-night
"colorscheme tokyonight-storm
"colorscheme tokyonight-day
set laststatus=2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
if !has('gui_running')
  set t_Co=256
endif
colorscheme tokyonight-moon
"colorscheme jellybeans
set termguicolors
"colorscheme embark
syntax enable
filetype plugin indent on
"colorscheme papaya
set clipboard=unnamedplus
set background=dark 
set nu!
let g:coc_global_extensions = [
      \'coc-markdownlint',
      \'coc-highlight',
      \'coc-explorer',
      \'coc-git',
      \'coc-snippets',
      \'coc-json',
      \'coc-clangd',
      \'coc-cmake',
      \'coc-pairs',
      \'coc-rust-analyzer',
      \'coc-yank',
      \'coc-lightbulb',
      \]
"      \'coc-spell-checker',
set mouse=a
set title
set cursorline
set encoding=utf-8 " Important to YCM
set autoindent
set smartindent
map q :quit<CR> " for quit only type q on command mode
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cc', 'h', 'hpp' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
 \ }]
let g:ycm_clangd_args=['--header-insertion=never']
set completeopt-=preview
" for save using Ctrl + s on command mode
" Need run this command: echo 'stty -ixon' >> ~/.bashrc && exec $SHELL
map <C-s> :write<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" <C-Enter>     Insert single / [count] newline.
"nnoremap <C-CR> i<CR><Esc>


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" fix CR in auto-pair and coc
"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() :
"  \ "\<C-g>u\<c-r>=v:lua.require'nvim-autopairs'.autopairs_cr()\<CR>"


inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "<CR>"


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"Ultisnips Settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
 
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


":let mapleader="\<Space>"
nnoremap <SPACE> <Nop>
"let mapleader=" "
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala,rust let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" Go to last active tab

au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

hi Visual  guifg=#ff0000 guibg=LightBlue gui=none
"hi Visual  guifg=#00ff99 guibg=LightBlue gui=none

nnoremap <Space><Tab> cgn

"nnoremap <C-g> <Nop>
"nmap <silent> <C-g> <Plug>(ale_next_wrap)
"let g:ale_sign_error = '●'
"let g:ale_sign_warning = '.'
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly','absolutepath', 'filename', 'modified' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
highlight Cursor guifg=white guibg=#ffcc00
highlight iCursor guifg=white guibg=#ff6600
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
let g:rustfmt_autosave = 1
hi CocInlayHint guibg=NONE guifg=#40e0d0 
"hi default CocRustChainingHint guibg=Red guifg=Blue ctermbg=0 ctermfg=8
nnoremap <c-k> m`O<esc>``
nnoremap <c-j> m`o<esc>``
inoremap <c-j> <esc>m`o<esc>``a
inoremap <c-k> <esc>m`O<esc>``a
" make enter after brakets work BRAINFUCK
"https://vi.stackexchange.com/questions/28675/automatically-place-closing-curly-brace-on-new-line
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" set sensible highlight matches that don't obscure the text
highlight MatchParen cterm=underline ctermbg=black ctermfg=NONE
highlight MatchParen gui=underline guibg=#88cc99 guifg=NONE
