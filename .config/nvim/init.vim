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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tomasiser/vim-code-dark'

Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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
runtime keybindings.vim

call bufferline#highlight#setup()

colorscheme codedark

" Command for copying to clipboard via xclip
command ClipCopy call system('xclip -selection clipboard', getreg('"'))

" Make netrw default to tree view
let g:netrw_liststyle= 3

" Attempt to load directory-specific session
autocmd VimEnter * call AutoLoadSession()
