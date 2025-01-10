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
autocmd FileType markdown,rst,gitcommit,mail,puppet,terraform set spell spelllang=en_gb
autocmd FileType markdown,rst,gitcommit,mail set tw=79
autocmd FileType puppet set shiftwidth=2
" highlight trailing whitespaces
:highlight TrailWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match TrailWhitespace /\s\+$\| \+\ze\t/
command Gci execute "!git ci %"
command Gcp execute "!git ci % && git push"
command Gp execute "!git push"
let @a='^wi~~A~~ddGp'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:terraform_fmt_on_save = 1
set directory=$HOME/.vim/swp//
iabbrev adn and
iabbrev teh the
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
map <leader>D :put =strftime('## %Y-%m-%d %H:%M')<CR><CR>
let g:copilot_filetypes = {
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'yaml': v:true
    \ }
 autocmd BufReadPre *
     \ let f=getfsize(expand("<afile>"))
     \ | if f > 100000 || f == -2
     \ | let b:copilot_enabled = v:false
     \ | endif
set rtp+=/opt/homebrew/opt/fzf


command GitLink :echo gitlink#GitLink()
function! CopyGitLink(...) range
  redir @+
  silent echo gitlink#GitLink(get(a:, 1, 0))
  redir END
endfunction
nmap <leader>gl :call CopyGitLink()<CR>
vmap <leader>gl :call CopyGitLink(1)<CR>


function! RunCompileOnSave()
 " You can replace /path/to/directory with your directory
    if stridx(expand('%:p:h'), '/Users/bob/git/dxw/dalmatian-config') == 0
        " Replace echo "Command executed!" with your command
        !echo "Compiling..."
        !/Users/bob/git/dxw/dalmatian-config/bin/compile
        !echo "Command executed!"
    endif
endfunction
function! RunTerraformDocsOnSave()
 " You can replace /path/to/directory with your directory
    if stridx(expand('%:p:h'), '/Users/bob/git/dxw/terraform-dxw-dalmatian-infrastructure') == 0
        " Replace echo "Command executed!" with your command
        !echo "Generating Terraform Docs..."
        !terraform-docs .
        !echo "docs generated"
    endif
endfunction

autocmd BufWritePost * call RunCompileOnSave()
autocmd BufWritePost * call RunTerraformDocsOnSave()
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000


let g:rustfmt_autosave = 1
source ~/.vim/autoexec.vim

