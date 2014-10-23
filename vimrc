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

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


let mapleader=","

NeoBundle 'kien/ctrlp.vim'
set wildignore+=*app/cache/*,*app/logs/*,*web/bundles/*,*web/css/*,*web/media/*,*web/js/*

NeoBundle 'sjbach/lusty'
set hidden

" Color for twig template
NeoBundle 'lepture/vim-jinja'

" Color end indent for less
NeoBundle 'groenewege/vim-less'


" Snipmate
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"
NeoBundle "scrooloose/nerdcommenter"

" Fantastic use...
NeoBundle 'arnaud-lb/vim-php-namespace'
noremap <silent> <Leader>u :call PhpInsertUse()<CR>
inoremap <silent> <Leader>u :call PhpInsertUse()<CR>
noremap <silent> <Leader>e :call PhpExpandClass()<CR>
inoremap <silent> <Leader>e :call PhpExpandClass()<CR>
" Vum symfony

NeoBundle 'docteurklein/vim-symfony'
let g:symfony_enable_shell_mapping = 0 "disable the mapping of symfony console

NeoBundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

NeoBundle 'mattn/emmet-vim'
nmap <silent> <Leader>z :call emmet#expandAbbr(3,"")<CR>
imap <silent> <Leader>z <Esc>h :call emmet#expandAbbr(3,"")<CR>

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
" Use your key instead of default key which is <C-F>
noremap <Leader>f :execute ":!"g:symfony_enable_shell_cmd<CR>

NeoBundle 'godlygeek/tabular.git'
nmap <Leader>a= :Tabularize /=<CR>
imap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
imap <Leader>a: :Tabularize /:\zs<CR>

NeoBundle 'ivalkeen/vim-ctrlp-tjump'
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>

" Enjoy with guard ctags composer
set tags+=vendor.tags

set number


" Do not create swap files
set nobackup
set nowritebackup
set noswapfile

" Recognize file types by extension
autocmd BufEnter *.twig set filetype=jinja
autocmd BufEnter *.php set filetype=php
autocmd BufEnter *.less set filetype=less
autocmd BufEnter *.js set filetype=javascript
autocmd BufEnter *.json set filetype=javascript
autocmd BufEnter *.yml set filetype=yaml

" Rules indent
set list
set listchars=tab:▸▸,trail:¬
set expandtab

" Maximum line text width
set textwidth=80
set wrap
" Always show line/column number
set ruler

autocmd FileType jinja setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2
autocmd FileType php setlocal shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
autocmd FileType less setlocal shiftwidth=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2



" Automatically create save directory if it does not exist
au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

