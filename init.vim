set relativenumber
set guicursor=i:block
syntax enable

"Plugins
call plug#begin("~/.vim/plugged")
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug'vim-airline/vim-airline'
Plug'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
call plug#end()

"Nerd Tree config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
"Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Toggle Nerd Tree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

"Fuzzy Finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
"Auto Indentation
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

"Copying to clipboard
vnoremap <C-c> "+y :let @+=@*<CR>
map <C-v> "+P

"Airline config
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'

"Tab length config
set expandtab
set shiftwidth=4


colorscheme gruvbox
