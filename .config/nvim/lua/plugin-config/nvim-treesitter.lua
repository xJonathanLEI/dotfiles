require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",

    sync_install = false,

    ignore_install = { "rust" },

    highlight = {
        enable = true
    },

    incremental_selection = {
        enable = true
    },

    indent = {
        enable = true
    }
}

-- Enable folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
