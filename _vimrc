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
" spell check certain files
" md by default isnt markdown but modula
" mkdir -p ~/.vim/ftdetect/ ; curl https://raw.github.com/tpope/vim-markdown/master/ftdetect/markdown.vim > ~/.vim/ftdetect/markdown.vim
" will fix that. 
autocmd FileType markdown,rst,gitcommit set spell
autocmd FileType puppet set shiftwidth=2
:highlight TrailWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match TrailWhitespace /\s\+$\| \+\ze\t/
