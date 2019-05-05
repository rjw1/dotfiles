set nocp
execute pathogen#infect()
syntax on
filetype plugin indent on

set background=dark
" colorscheme darkelf
" use indents of 2 spaces, and have them copied down lines:
set shiftwidth=2
set shiftround
set autoindent
set tabstop=8
set hlsearch
set expandtab
set colorcolumn=80
set modeline
set modelines=5
" spell check certain files
" md by default isnt markdown but modula
" mkdir -p ~/.vim/ftdetect/ ; curl https://raw.github.com/tpope/vim-markdown/master/ftdetect/markdown.vim > ~/.vim/ftdetect/markdown.vim
" will fix that. 
autocmd FileType markdown,rst,gitcommit,mail,puppet,terraform,json set spell
autocmd FileType puppet set shiftwidth=2
" highlight trailing whitespaces
:highlight TrailWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match TrailWhitespace /\s\+$\| \+\ze\t/
command Gci execute "!git ci %"
command Gcp execute "!git ci % && git push"
command Gp execute "!git push"
let @a='^wi~~A~~ddGp'
let g:terraform_fmt_on_save=1
