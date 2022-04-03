lua require('plugin-config/nvim-treesitter')

" This is needed for the solidity treesitter parser to work
au BufRead,BufNewFile *.sol set ft=solidity

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
