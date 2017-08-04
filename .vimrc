set shell=/bin/bash

call pathogen#infect()

set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Bundles
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'tomtom/tlib_vim'
Bundle 'marcweber/vim-addon-mw-utils'
"Bundle 'garbas/vim-snipmate'
"Bundle 'othree/vim-autocomplpop'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-gitgutter'
"Bundle 'ervandew/supertab'
Bundle 'guns/xterm-color-table.vim'
Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'Yggdroot/indentLine'
Bundle 'eparreno/vim-l9'
Bundle 'elzr/vim-json'
"Bundle 'nathanaelkane/vim-indent-guides'
call vundle#end()
filetype plugin indent on

"Basic Configs
set shiftwidth=4
set expandtab
set softtabstop=4
set laststatus=2
set noshowmode
set number
set modeline
set t_Co=256
set tabstop=4
set cursorline


syntax on
autocmd filetype python nnoremap <F9> :w <bar> exec '!python '.shellescape('%')<CR>

autocmd filetype c nnoremap <F9> :w <bar> exec '!echo -n "================================================================================";TEMP=`mktemp`;script $TEMP -e -q -c "gcc '.shellescape('%').' -std=c11 -Wall -o '.shellescape('%:r').'" > /dev/null 2>&1 ;if [ $? == 0 ] ;then echo -e "\r\033[32m================================================================================\033[0m";./'.shellescape('%:r').';else echo -e "\r\033[31m================================================================================\033[0m";cat $TEMP; fi'<CR>
autocmd filetype cpp nnoremap <F9> :w <bar> exec '!echo -n "================================================================================";TEMP=`mktemp`;script $TEMP -e -q -c "g++ '.shellescape('%').' -std=c++11 -Wall -o '.shellescape('%:r').'" > /dev/null 2>&1 ;if [ $? == 0 ] ;then echo -e "\r\033[32m================================================================================\033[0m";./'.shellescape('%:r').';else echo -e "\r\033[31m================================================================================\033[0m";cat $TEMP; fi'<CR>
autocmd filetype c nnoremap <F8> :w <bar> exec '!echo -n "================================================================================";TEMP=`mktemp`;script $TEMP -e -q -c "gcc '.shellescape('%').' -std=c11 -Wall -o '.shellescape('%:r').'" > /dev/null 2>&1 ;if [ $? == 0 ] ;then echo -e "\r\033[32m================================================================================\033[0m";else echo -e "\r\033[31m================================================================================\033[0m";cat $TEMP; fi'<CR>
autocmd filetype cpp nnoremap <F8> :w <bar> exec '!echo -n "================================================================================";TEMP=`mktemp`;script $TEMP -e -q -c "g++ '.shellescape('%').' -std=c++11 -Wall -o '.shellescape('%:r').'" > /dev/null 2>&1 ;if [ $? == 0 ] ;then echo -e "\r\033[32m================================================================================\033[0m";else echo -e "\r\033[31m================================================================================\033[0m";cat $TEMP; fi'<CR>
nnoremap <F7> :w <bar> exec '!echo -n "copy to clipboard";cat '.shellescape('%').' <bar> xclip -selection clipboard' <CR>



"Specific Configs

"theme
color Tomorrow-Night-Bright
colorscheme Tomorrow-Night-Bright

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_disableautocomplete = 1
let g:neocomplcache_enable_smart_case = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
let g:neocomplcache_enable_insert_char_pre = 1

"betterwhitspace
hi ExtraWhitespace ctermbg = darkgray

hi Normal ctermbg=235
hi CursorLine ctermbg=234
hi LineNr ctermfg=gray

"indent-guide
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 3
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd ctermbg = 235
"hi IndentGuidesEven ctermbg = 233
function! Sudowrite()
    w !sudo tee % > /dev/null
    edit!
endfunction
command W call Sudowrite()
