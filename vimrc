
set autochdir
set autoindent
set autoread
set background=dark
set expandtab
set hidden
set history=1000
set hlsearch
set laststatus=2
set mouse=a
set nobackup
set nocompatible
set nonumber
set nopaste
set noswapfile
set nowritebackup
set shell=/bin/bash
set shiftwidth=2
set smartindent
set softtabstop=2
set textwidth=80
set wrap linebreak nolist


" ======== VUNDLE ========
filetype off
set rtp+=~/.vim/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins here
Plugin 'bling/vim-bufferline'
Plugin 'dag/vim-fish'
Plugin 'itchyny/lightline.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/nginx.vim'
Plugin 'elzr/vim-json'
Plugin 'flowtype/vim-flow'
Plugin 'wting/rust.vim'

call vundle#end()



filetype plugin indent on
syntax   enable
autocmd! bufwritepost           vimrc       source %
autocmd! bufwritepost          .vimrc       source %
autocmd  bufreadpost,bufnewfile *.md        set filetype=markdown
autocmd  bufreadpost,bufnewfile Vagrantfile set filetype=ruby

:imap kj <Esc>

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

set t_Co=256
let g:lightline =  {
      \ 'active' : { 'right' : [ ['percent']
      \                        , ['lineinfo'] 
      \                        , ['filetype'] 
      \                        ]
      \            }
      \ }
let g:markdown_fenced_languages = [
      \ 'html', 'php',
      \ 'javascript', 'js=javascript',
      \ 'sh', 'bash=sh',
      \ ]
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
