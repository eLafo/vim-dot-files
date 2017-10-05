set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

Plugin 'carakan/new-railscasts-theme'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'posva/vim-vue'

Plugin 'vim-ruby/vim-ruby'

Plugin 'tpope/vim-rails'

Plugin 'ekalinin/dockerfile.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'scrooloose/syntastic'
Plugin 'ngmy/vim-rubocop'

Plugin 'tpope/vim-endwise'

Plugin 'thoughtbot/vim-rspec'

Plugin 'tpope/vim-surround'

Plugin 'airblade/vim-gitgutter'

Plugin 'mileszs/ack.vim'

Plugin 'tpope/vim-liquid'
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

set number
set expandtab
set tabstop=2
set shiftwidth=2
set shell=/bin/bash
set smartindent
set scrolloff=2

syntax enable
if !empty(glob("~/.vim/bundle/new-railscasts"))
  colorscheme new-railscasts
endif

"syntastic & rubocop"
if !empty(glob("~/.vim/bundle/sytastic"))
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_ruby_checkers = ['rubocop']
end

" vim-airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='light'

" leader
let mapleader = ","

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" search
set incsearch

" update time
set updatetime=250

" use silversearch
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ctrlp configuration
let g:ctrlp_show_hidden = 1
