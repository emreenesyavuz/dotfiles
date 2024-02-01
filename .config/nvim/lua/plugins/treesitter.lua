
require("nvim-treesitter.install").prefer_git = true

require('nvim-treesitter.configs').setup({
      highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
        },
      incremental_selection = {
      enable = true,
      keymaps = {
            init_selection = '<TAB>',
          node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
                },
                  },
        ensure_installed = {
        'lua',
        'vim',
        'python',
        'r'
          },
        auto_install = true,
})

require'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ai"] = "@parameter.inner",
                ["aa"] = "@parameter.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                --         -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            },
            include_surrounding_whitespace = true,
        },
    },
}
