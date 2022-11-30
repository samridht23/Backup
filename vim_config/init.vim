filetype plugin on

call plug#begin(stdpath('data') . '/plugged')
Plug 'rakr/vim-one'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'Yggdroot/indentLine'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact'] }
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
Plug 'pantharshit00/vim-prisma'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}

"Plug 'vimsence/vimsence'

Plug 'andweeb/presence.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'hoob3rt/lualine.nvim'
call plug#end()

let g:one_allow_italics=1

let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
set exrc
set secure
set clipboard=unnamedplus
set mouse=a
set nowrap
set textwidth=0
set wrapmargin=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nosmarttab
set autoindent
set nu rnu
set incsearch
set inccommand=split
set showmatch
set showtabline=1
set noshowmode

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

"Show spaces and tabs
set list
set listchars=space:·,tab:→\ 

let mapleader = ","
nmap <Leader>s :source ~/.config/nvim/init.vim<cr>
nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

map <C-l> :set spell! spelllang=en_us<cr>

nnoremap <leader>o :!tmux splitw -h -p 30 -c $(pwd)<CR><C-L>
nnoremap <leader>t :!tmux send-keys -t 1 C-c<CR><C-L>

"Auto Indentation
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}


imap "" ""<esc>i
imap '' ''<esc>i
imap `` ``<esc>i
imap (( ()<esc>i
imap \[\[ \[\]<esc>i
imap {{ {}<esc>i
