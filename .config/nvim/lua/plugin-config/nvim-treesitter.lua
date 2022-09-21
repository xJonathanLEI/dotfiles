require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",

    ignore_install = { "phpdoc" },

    sync_install = false,

    highlight = {
        enable = true,
        disable = { "rust" }
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
