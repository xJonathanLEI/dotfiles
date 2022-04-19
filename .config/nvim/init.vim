set termguicolors
set number
set mouse=a
set updatetime=100

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tab line
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Multi-cursor support
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Treesitter syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Make VIM look like VS Code
Plug 'tomasiser/vim-code-dark'

" Git plugin
Plug 'tpope/vim-fugitive'

" File explorer
Plug 'preservim/nerdtree'

" VIM sessions with NERDTree support
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Status line
Plug 'vim-airline/vim-airline'

" For highlighting lines modified
Plug 'airblade/vim-gitgutter'

" For file search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" For showing Git status in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

let g:coc_global_extensions = [
  \'coc-rust-analyzer',
  \'coc-tsserver',
  \'coc-json',
  \'coc-pyright',
  \'coc-prettier',
  \'coc-lists'
  \]

" Load individual initialization files
runtime init/coc.vim
runtime init/bufferline.vim
runtime init/treesitter.vim
runtime init/nerdtree.vim
runtime init/nerdtree_git.vim
runtime keybindings.vim

call bufferline#highlight#setup()

colorscheme codedark

" Command for copying to clipboard via xclip
command ClipCopy call system('xclip -selection clipboard', getreg('"'))

" Make netrw default to tree view
let g:netrw_liststyle= 3

" Attempt to load directory-specific session
autocmd VimEnter * call AutoLoadSession()
