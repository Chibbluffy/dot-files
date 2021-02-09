" To setup run below commands:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim
" :InstallPlugins

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tarekbecker/vim-yaml-formatter'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" disables folding"
set nofoldenable

execute pathogen#infect()
syntax on
filetype plugin indent on

au BufNewFile,BufRead *.sux set filetype=javascript

:nmap \l :setlocal number!<CR>

:nmap \e :NERDTreeToggle<CR>
:nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
:nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
:nmap \M :set noexpandtab tabstop=8 softstabstop=4 shiftwidth=4<CR>
:nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
:nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

"global copy and paste. might be * instead of + on some systems"
"for Mac, must do 'brew install vim' to use the clipboard
:nmap \y "+yy
:nmap \p "+p

:set background=light

:set expandtab
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set number
:set relativenumber
:set nocompatible
:set clipboard=unnamed " for Mac
" :set clipboard=unnamedplus " for Linux

:set backspace=indent,eol,start  " more powerful backspacing

:set splitbelow
:set splitright

:set mouse=a

:set colorcolumn=80

" swaps j and k bindings
":nnoremap j k
":nnoremap k j
":vnoremap j k
":vnoremap k j


let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_opertions = "-std=c++11 -Wall -Wextra -Wpedantic"

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts   :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()


" cool custom shortcuts
" =====================
"json linter
:nmap \j <Esc>:%!python -m json.tool<CR>
"ESC
":imap jk <Esc>
:imap yy <Esc>
"closes preview"
:nmap tt :pclose<CR>
"adds a space"
:nmap <space> i<space><Esc>
"re-sources vimrc
:nnoremap \v :source ~/.vimrc<CR>


"Rebindings for Workman keyboard layout
"J AND K (N AND E) STILL SWAPPED :P
:noremap  q q
:noremap  d w
:noremap  r e
:noremap  w r
:noremap  b t
:noremap  j y
:noremap  f u
:noremap  u i
:noremap  p o
:noremap  ; p
:noremap  a a
:noremap  s s
:noremap  h d
:noremap  t f
:noremap  g g
:noremap  y h
:noremap  n k
:noremap  e j
:noremap  o l
:noremap  i ;
:noremap  z z
:noremap  x x
:noremap  m c
:noremap  c v
:noremap  v b
:noremap  k n
:noremap  l m

