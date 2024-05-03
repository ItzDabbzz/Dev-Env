return {
    -- Undo tree
    {
        "mbbill/undotree",
    },
    -- Save and restore session
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        keys = {
            {
                "<leader>qs",
                function()
                    require("persistence").load()
                end,
                desc = "Restore Session",
            },
            {
                "<leader>ql",
                function()
                    require("persistence").load({ last = true })
                end,
                desc = "Restore Last Session",
            },
            {
                "<leader>qQ",
                function()
                    require("persistence").stop()
                    vim.cmd.qall()
                end,
                desc = "Quit Without Saving Session",
            },
        },
        opts = {
            options = { "buffers", "curdir", "tabpages", "winsize", "globals", "skiprtp", "folds" },
        },
    },
    -- Comment with haste
    {
        "numToStr/Comment.nvim",
        opts = {},
        config = function()
            require('Comment').setup()
        end,
    },
    -- Move stuff with <M-j> and <M-k> in both normal and visual mode
    {
        "echasnovski/mini.move",
        config = function()
            require("mini.move").setup()
        end,
    },
    -- Better buffer closing actions. Available via the buffers helper.
    {
        "kazhala/close-buffers.nvim",
        opts = {
            preserve_window_layout = { "this", "nameless" },
        },
    },
    {
        'akinsho/toggleterm.nvim',
        branch = "main",
        version = "*",
        cmd = {
            "ToggleTerm",
            "TermExec",
            "ToggleTermToggleAll",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
        },
        opts = { --[[ things you want to change go here]] }
    },
    "airblade/vim-rooter",   -- Set working directory to project root
    {
        "uga-rosa/ccc.nvim", -- Colorize color codes
        event = "User LazyFile",
    },
    {
        "petertriho/nvim-scrollbar", -- Nice scroll bar with git integration
        event = "User LazyFile",
        opts = {
            hide_if_all_visible = true,
            handle = {
                highlight = "ScrollbarHandle",
            },
            handlers = {
                cursor = true,
                diagnostic = true,
                gitsigns = true, -- Requires gitsigns
                search = true,   -- Requires hlslens
            },
            marks = {
                Cursor = { text = "—" },
                Search = { text = { "—", "󰇼" } },
                Error = { text = { "—", "󰇼" } },
                Warn = { text = { "—", "󰇼" } },
                Info = { text = { "—", "󰇼" } },
                Hint = { text = { "—", "󰇼" } },
                Misc = { text = { "—", "󰇼" } },
                GitAdd = { text = "▎" },
                GitChange = { text = "▎" },
                GitDelete = { text = "▁" },
            },
        },
    },

    -- Show context of the current cursor position
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "User LazyFile",
        opts = {
            max_lines = 3,
        },
    },
    -- Highlight different level brackets with different color
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "User LazyFile",
    },

    -- Highlight matched bracket
    {
        "monkoose/matchparen.nvim",
        event = "User LazyFile",
        opts = {},
    },
    {
        "folke/neodev.nvim",
        opts = {},
        config = function()
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        "jamestthompson3/nvim-remote-containers",
    },
    {
        "ryanmsnyder/toggleterm-manager.nvim",
        dependencies = {
            "akinsho/nvim-toggleterm.lua",
            "nvim-telescope/telescope.nvim",
        },
        config = true,
    },
    "nvim-lua/plenary.nvim",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "User FileOpened",
        opts = {
            keywords = {
                FIX = {
                    icon = require("helpers.icons").diagnostics.Bug .. " F", -- icon used for the sign, and in search results
                    color = "error",                                         -- can be a hex color, or a named color (see below)
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },              -- a set of other keywords that all map to this FIX keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = { icon = require("helpers.icons").ui.Note .. " T", color = "info" },
                HACK = { icon = require("helpers.icons").ui.Fire .. " H", color = "warning" },
                WARN = { icon = require("helpers.icons").diagnostics.Warning .. " W", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = require("helpers.icons").diagnostics.BoldQuestion .. " P", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = require("helpers.icons").diagnostics.Hint .. " N", color = "hint", alt = { "INFO" } },
                TEST = { icon = require("helpers.icons").diagnostics.BoldHint .. " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            },
            gui_style = {
                fg = "NONE",       -- The gui style to use for the fg highlight group.
                bg = "BOLD",       -- The gui style to use for the bg highlight group.
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line conta
        },
    },

    -- Highlight matched bracket
    {
        "monkoose/matchparen.nvim",
        event = "User LazyFile",
        opts = {},
    },

    -- Highlight undo/redo change
    {
        "tzachar/highlight-undo.nvim",
        keys = {
            { "u",     desc = "Undo" },
            { "<C-R>", desc = "Redo" },
            { "<C-Z>", "<Cmd>normal u<CR>", mode = "i", desc = "Undo" },
        },
        opts = {
            -- Same as highlight on yank
            duration = 150,
            undo = { hlgroup = "Search" },
            redo = { hlgroup = "Search", lhs = "U" },
        },
    },
    {
        -- TODO: Set this up
        "RRethy/vim-illuminate",
        event = "User FileOpened",
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")

            -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })
        end,
    },
    {
        "ajeetdsouza/zoxide"
    },
    { 'wakatime/vim-wakatime', lazy = false }
}
