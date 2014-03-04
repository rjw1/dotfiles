syntax on
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
autocmd FileType markdown,rst set spell
autocmd FileType puppet set shiftwidth=2
:highlight TrailWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match TrailWhitespace /\s\+$\| \+\ze\t/
