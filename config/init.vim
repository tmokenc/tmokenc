set hidden
set number
set mouse=a
set hlsearch

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set clipboard=unnamedplus

set foldmethod=indent
set foldlevel=99
set laststatus=2
set lazyredraw
set updatetime=360 " Default is 4000, which is slow
set shortmess+=c " dont't give |ins-completion-menu| message
" set signcolumn=yes " Always show signcolumns
set cmdheight=2

" make the split more natural
set splitright
set splitbelow

" Some servers have issues with backup files...
set nobackup
set nowritebackup

" The cursor's line highlight
set cursorline
set colorcolumn=82 " set cc=82

" ================>>> PLUGINS <<<====================
call plug#begin('~/.local/share/nvim/plugged')  

Plug 'bling/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'raimondi/delimitmate'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" let g:coc_global_extensions = \"coc-rls coc-json coc-css coc-tsserver coc-html"

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'

" Syntax highlight for over 100 format
Plug 'sheerun/vim-polyglot'

" Color schemes
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim', { 'as': 'dracula' }


call plug#end()

color jellybeans
let g:airline_theme = "dracula"
let g:delimitMate_expand_cr = 2

let g:rustfmt_autosave = 1
let g:rustfmt_options = "--edition 2018"



" ==========>>> MAPPING KEY <<<================

" Make use of Function keys
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

" Remove highlighting
nmap <F3> :let @/=''<CR>
imap <F3> <Esc>:let @/=''<CR>i

" Esc to exit the terminal mode
tnoremap <Esc> <C-\><C-n>

"To use Alt+{h, j, k, l} to navigate windows
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, but this will mess with the delimitmate tho
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlighting stuff
hi ColorColumn ctermbg=darkgrey

"autocmd groups
augroup Overdrive 
    autocmd!
    autocmd ColorScheme * hi ColorColumn ctermbg=grey
augroup END

augroup FileTypeIndent 
    autocmd!
    autocmd FileType html,js,json,css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
