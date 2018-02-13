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
Plugin 'mtscout6/syntastic-local-eslint.vim'

Plugin 'tpope/vim-endwise'

Plugin 'thoughtbot/vim-rspec'
Plugin 'rlue/vim-fold-rspec'

Plugin 'tpope/vim-surround'

Plugin 'airblade/vim-gitgutter'

Plugin 'mileszs/ack.vim'

Plugin 'tpope/vim-liquid'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'Yggdroot/indentLine'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
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

" More natural opening
set splitbelow
set splitright
syntax enable
if !empty(glob("~/.vim/bundle/new-railscasts-theme"))
  colorscheme new-railscasts
endif

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

" show hidden files
let g:ctrlp_show_hidden = 1
let NERDTreeShowHidden=1

"load aliases
let $BASH_ENV="~/.bash_aliases"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec='$(npm bin)/eslint'

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" ruby folding
let g:ruby_fold = 1
"let g:ruby_foldable_groups = 'def #'

"rspec folding
let g:fold_rspec_foldenable = 1      " disables folding (toggle with `zi`)
let g:fold_rspec_foldlevel = 2       " sets initial open/closed state of all folds (open unless nested more than two levels deep)
let g:fold_rspec_foldcolumn = 4      " shows a 4-character column on the lefthand side of the window displaying the document's fold structure
let g:fold_rspec_foldclose = 0       " closes folds automatically when the cursor is moved out of them (only applies to folds deeper than 'foldlevel')
let g:fold_rspec_foldminlines = 3    " disables closing of folds containing two lines or fewer

" disable markdown folding
let g:vim_markdown_folding_disabled = 1

" custom mappings
nmap <CR> o<ESC>k
nmap <S-Enter> O<Esc>j

" NERDcommenter
let g:NERDSpaceDelims = 1
