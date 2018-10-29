" Fish Shell
set shell=/bin/bash

" Editor
syntax enable

" Update files written to outside of vim
set autoread

" remember info about open buffers on close
set viminfo^=%

" Encodings
set encoding=utf-8
set fileencoding=utf-8

" Line numbers
set number

" Indentation
set autoindent
set smartindent

" Tabs
set expandtab
set softtabstop=4
set tabstop=2 shiftwidth=2      " a tab is two spaces
set tabstop=4
set backspace=eol,start,indent
set laststatus=2

" Don't wrap text
set nowrap

" Search
set wildignore=node_modules,vendor
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Command-line completion in an enhanced mode
set wildmenu

" ignore case when searching
set ignorecase

" override ignorecase if the search pattern contains upper case characters
set smartcase

"yank to os clipboard
set clipboard^=unnamed

"UI
set mouse=a

" do all work in memory, no swap file
set noswapfile
set ruler
set hidden
set history=1000

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Tags
set tags=./tags
set tags+=/home/matt/dev/dt_local/src/websites/www.digitaltrends.com/tags

" treat `$` as part of the word in PHP and JavaScript
au Filetype php        setlocal iskeyword+=$
au Filetype javascript setlocal iskeyword+=$

" treat `.`, and `#`  as part of the word in CSS and SCSS
au Filetype css  setlocal iskeyword+=.,#
au Filetype scss setlocal iskeyword+=.,#

" Line numbers
set number

" Remap leader
let mapleader = ","

" QUIT
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>q :wq<CR>

" NAVIGATION
set cursorline
map K :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
map J :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" Autocomplete
set completeopt=menu,menuone,longest

" first non-blank space char
map 0 ^
" close buffer
map <C-x> :bd<cr>
" buffer control
map <C-l> :bp<cr>
map <C-;> :bn<cr>
" tab control
map <C-'> :tabp<cr>
" map <C-;> :tabn<cr>
" map <C-i> :tabnew<cr>

" Vundle
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Main
Plugin 'L9'
Plugin 'VundleVim/Vundle.vim'

" Navigation
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'

" Code stuff
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'
Plugin 'ap/vim-css-color'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'leafgarland/typescript-vim'

" Autocomplete
Plugin 'Shougo/neocomplete.vim'
Plugin 'ervandew/supertab'

" PHP
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'salcode/vim-wordpress-dict'

" Linting
Plugin 'w0rp/ale'

" Search
Plugin 'mileszs/ack.vim'

" Theme
Plugin 'arcticicestudio/nord-vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

" Supertab
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Gitgutter
let g:gitgutter_max_signs = 3000

" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_completion_enabled = 1

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '(node_modules|vendor)'

" Easymotion

nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Neocomplete
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\|\h\w*::\|\(new\|use\|extends\|implements\)\s'
let g:neocomplete#sources#omni#input_patterns.javascript = '[a-zA-Z_$]\{3,}\|\.[a-zA-Z_$]*'

" PHPcompletetion
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
let g:phpcomplete_parse_docblock_comments = 1

" NERDTree
let NERDTreeShowHidden = 1

"Toggle on CTRL-n
map <C-n> :NERDTreeToggle<CR>

" Theme
if has('termguicolors')
    set termguicolors
endif

let g:nord_italic_comments = 1
color nord

" Airline
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" cursor

if $TERM_PROGRAM =~ "iTerm.app"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
