lua require('plugin-config/nvim-treesitter')

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
