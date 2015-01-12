" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle "tpope/vim-pathogen"
NeoBundle "othree/html5.vim"
NeoBundle 'lepture/vim-jinja'
NeoBundle 'bling/vim-airline'
NeoBundle 'sjbach/lusty'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'ivalkeen/vim-ctrlp-tjump'
NeoBundle 'docteurklein/php-getter-setter.vim'
NeoBundle 'arnaud-lb/vim-php-namespace'
NeoBundle 'docteurklein/vim-symfony'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'airblade/vim-gitgutter'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"----- Global Settings -----

set laststatus=2
set colorcolumn=80
set hidden
let mapleader=","

" Enjoy with guard ctags composer
set tags+=vendor.tags
set number
let g:mapleader = ","
"------ Indentation ------
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set list
set listchars=tab:▸▸,trail:¬
set backspace=indent,eol,start
autocmd FileType javascript,html,twig,css setl sw=2 sts=2 et

"----- Colors -----
set t_Co=256
syntax enable
set background=dark
colorscheme railscasts
set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
set cursorline
set mouse=a


" Recognize file types by extension
autocmd BufEnter *.twig set filetype=jinja
autocmd BufEnter *.php set filetype=php
autocmd BufEnter *.less set filetype=less
autocmd BufEnter *.js set filetype=javascript
autocmd BufEnter *.json set filetype=javascript
autocmd BufEnter *.yml set filetype=yaml

" ###### Params for bundle #####
" --- Vim Php Namespace
noremap <silent> <Leader>u :call PhpInsertUse()<CR>
inoremap <silent> <Leader>u :call PhpInsertUse()<CR>
noremap <silent> <Leader>e :call PhpExpandClass()<CR>
inoremap <silent> <Leader>e :call PhpExpandClass()<CR>

" --- Vim Symfony
let g:symfony_enable_shell_mapping = 0 "disable the mapping of symfony console

" --- Emmet
nmap <silent> <Leader>z :call emmet#expandAbbr(3,"")<CR>
imap <silent> <Leader>z <Esc>h :call emmet#expandAbbr(3,"")<CR>

" Use your key instead of default key which is <C-F>
noremap <Leader>f :execute ":!"g:symfony_enable_shell_cmd<CR>

" --- Tabular
nmap <Leader>a= :Tabularize /=<CR>
imap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
imap <Leader>a: :Tabularize /:\zs<CR>

" --- Ctrl Jump
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" Enjoy with :e :-)

" Automatically create save directory if it does not exist
au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

" Clean space...
"----- Remove trailing spaces (unless markdown file type)
fun! StripTrailingWhitespace()
" don't strip on these filetypes
if &ft =~ 'markdown'
    return
endif
%s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
