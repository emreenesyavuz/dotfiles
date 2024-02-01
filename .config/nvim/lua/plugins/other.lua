
-- Nvim Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup {}

require("nvim-autopairs").setup {}

require("smartcolumn").setup({
    colorcolumn = "88"
})

require("nvim-surround").setup({
    -- Configuration here, or leave empty to use defaults
})

require('Comment').setup()


vim.cmd [[
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
]]
