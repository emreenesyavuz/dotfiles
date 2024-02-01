require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
            config = {
                icon_preset = "basic"
            }
        }, -- Adds pretty icons to your documents
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
                name = "[Neorg]",
            }
        },
        ["core.integrations.treesitter"] = {
            config = {
                configure_parsers = true,
                install_parsers = true,
            }
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
            workspaces = {
                notes = "~/notes",
            },
        },
    },
},
      }

