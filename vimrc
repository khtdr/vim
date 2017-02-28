
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
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-scripts/nginx.vim'
Plugin 'elzr/vim-json'
Plugin 'flowtype/vim-flow'
Plugin 'wting/rust.vim'
Plugin 'leafgarland/typescript-vim'

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
      \ 'colorscheme': 'solarized',
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
let g:flow#autoclose = 1


" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction


