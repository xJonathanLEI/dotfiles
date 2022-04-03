set termguicolors
set number

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

call plug#end()

let g:coc_global_extensions = [
  \'coc-rust-analyzer',
  \'coc-tsserver',
  \'coc-json'
  \]

" Load individual initialization files
runtime init/coc.vim
runtime init/bufferline.vim
runtime init/treesitter.vim
runtime keybindings.vim

call bufferline#highlight#setup()
