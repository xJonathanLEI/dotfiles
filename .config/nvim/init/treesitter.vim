lua require('plugin-config/nvim-treesitter')

" This is needed for the solidity treesitter parser to work
au BufRead,BufNewFile *.sol set ft=solidity

" Pretend Cairo is Python to get basic highlighting
au BufRead,BufNewFile *.cairo set ft=python

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
