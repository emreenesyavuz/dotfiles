-- completeopt is used to manage code suggestions
-- menuone: show popup even when there is only one suggestion
-- noinsert: Only insert text when selection is confirmed
-- noselect: force us to select one from the suggestions
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert', 'preview'}
-- shortmess is used to avoid excessive messages
vim.opt.shortmess = vim.opt.shortmess + { c = true}

local cmp = require'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({ 

    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    formatting = {
        format = function(entry, vim_item)
            if vim.tbl_contains({ 'path' }, entry.source.name) then
                local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind = icon
                    vim_item.kind_hl_group = hl_group
                    return vim_item
                end
            end
            return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
        end
    },

    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- Shift+TAB to go to the Previous Suggested item
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        -- Tab to go to the next suggestion
        ['<Tab>'] = cmp.mapping.select_next_item(),
        -- CTRL+SHIFT+f to scroll backwards in description
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        -- CTRL+F to scroll forwards in the description
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- CTRL+SPACE to bring up completion at current Cursor location
        ['<C-Space>'] = cmp.mapping.complete(),
        -- CTRL+e to exit suggestion and close it
        ['<C-e>'] = cmp.mapping.close(),
        -- CR (enter or return) to CONFIRM the currently selection suggestion
        -- We set the ConfirmBehavior to insert the Selected suggestion
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },

    -- sources are the installed sources that can be used for code suggestions
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp'},
        { name = 'nvim_lsp_signature_help'}, 
        { name = 'nvim_lua'},
        { name = 'neorg' },
        { name = 'buffer'},
        { name = 'ultisnips' }, -- For ultisnips users.
    },

    cmp.setup({
        view = {            
            entries = "custom" -- can be "custom", "wildmenu" or "native"
        }                   
    })

})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
