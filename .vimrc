source $VIMRUNTIME/vimrc_example.vim

au GUIEnter * simalt ~x
set hls
set is
set cb=unnamed
set gfn=Fixedsys:h10
set autoread
set ruler
set ts=4
syntax enable
set sw=4
set si 
set nu
set autoindent
set nobackup

"Plug plugin manager
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chiel92/vim-autoformat'
Plug 'preservim/nerdtree'
call plug#end()

"Nerd tree command
nnoremap <C-n> :NERDTreeToggle<CR>

"Airline config
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1

"Compiling c++14
noremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < input.txt<CR>
inoremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o "%<" "%" && "./%<" < input.txt<CR>

"Commenting single line
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

"cpp template 
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
"Auto indentation of bracket 
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
"For copy and pasting in vim
vnoremap <C-c> "+y :let @+=@*<CR>
map <C-v> "+P
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

