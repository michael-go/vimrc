set nocompatible
filetype off

" Clear all autocommands
autocmd!

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'othree/html5.vim'
Plugin 'tomasr/molokai'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'

call vundle#end()

" General
filetype plugin indent on
syntax on
set hidden
set autoread

" Temporary files stuff
set nobackup
set writebackup
set noswapfile

" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Editing
set backspace=indent,eol,start
inoremap <expr> <c-e> pumvisible() ? '<c-e>' : '<end>'
inoremap <c-u> <c-g>u<c-u>
set formatoptions+=j
set nojoinspaces

" Formatting
nnoremap <leader>ff :%!js-beautify -j -q -B -f -<CR>

" Windows
set splitright

" Searching
set incsearch

" Movement
" Remember long moves to jumplist
nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>
" Scrolling
noremap <c-j> 3<c-e>
noremap <c-k> 3<c-y>

" Faster save
noremap <Leader>w :write<cr>

" Visual
set cursorline
set laststatus=2
set ruler
set number
set showcmd
set colorcolumn=81

" Color scheme
set t_Co=256
set background=dark
colorscheme molokai

" Font
set guifont=Monospace\ 12

" Hebrew/RTL
noremap <F2> :setlocal invrightleft<cr>
inoremap <F2> <c-o>:setlocal invrightleft<cr>

" Tags
noremap g] g<c-]>

" Encryption
set cryptmethod=blowfish

" Global substitute
nnoremap gs :%s/<c-r><c-w>/
nnoremap gS :%s/<c-r><c-a>/

" System clipboard stuff
map zy "+y
map zY "+Y
map zp "+p
map zP "+P

"""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""
augroup vimrc
    " Clear all commands in the group
    autocmd!

    autocmd FileType text,markdown setlocal textwidth=78
    autocmd FileType help setlocal number relativenumber

    autocmd BufWritePost $MYVIMRC source %
augroup END

nnoremap <leader>V :tabe $MYVIMRC<cr>

" Edit files in current directory
cnoremap %% <c-r>=expand('%:h').'/'<cr>
map <leader>e :edit %%

" plugin custom settings:

" tagbar:
noremap <F8> :TagbarToggle<cr>

" golang:
"let g:go_bin_path=expand('~/.go/bin')
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:golang_onwrite = 0
au FileType go nmap <c-i> <Plug>(go-def)

" syntastic:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_python_flake8_args='--ignore=E501,E302,W391'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" rainbow:
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['yellow',      'yellow'],
    \ ['white',       'white'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 1
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
