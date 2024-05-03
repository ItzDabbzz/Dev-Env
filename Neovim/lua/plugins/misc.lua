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
    { 'wakatime/vim-wakatime', lazy = false },
    -- Display search info after match results
    {
        "kevinhwang91/nvim-hlslens",
        event = "CmdlineEnter",
        keys = {
            {
                "n",
                [[<Cmd>execute("normal! " . v:count1 . "Nn"[v:searchforward])<CR><Cmd>lua require("hlslens").start()<CR>]],
                mode = { "n", "x" },
                desc = "Repeat last search in forward direction",
            },
            {
                "N",
                [[<Cmd>execute("normal! " . v:count1 . "nN"[v:searchforward])<CR><Cmd>lua require("hlslens").start()<CR>]],
                mode = { "n", "x" },
                desc = "Repeat last search in backward direction",
            },
            {
                "*",
                [[*<Cmd>lua require("hlslens").start()<CR>]],
                desc = "Search forward for nearest word (match word)",
            },
            {
                "#",
                [[#<Cmd>lua require("hlslens").start()<CR>]],
                desc = "Search forward for nearest word (match word)",
            },
            {
                "g*",
                [[g*<Cmd>lua require("hlslens").start()<CR>]],
                mode = { "n", "x" },
                desc = "Search forward for nearest word",
            },
            {
                "g#",
                [[g#<Cmd>lua require("hlslens").start()<CR>]],
                mode = { "n", "x" },
                desc = "Search backward for nearest word",
            },
        },
        opts = {
            calm_down = false, -- enable this if you want to execute :nohl automatically
            enable_incsearch = false,
            override_lens = function(render, posList, nearest, idx, _)
                --                           🠇 This is \u00A0 since ascii space will disappear in vscode
                local text = nearest and ("%s [%d/%d]"):format(vim.fn.getreg("/"), idx, #posList) or ""
                local chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
                local lnum, col = unpack(posList[idx])
                render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
            end,
        },
    },
    -- Better yank/paste
    {
        "gbprod/yanky.nvim",
        -- stylua: ignore
        keys = {
            { "<Leader>sy", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
            { "<Leader>sp", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
            { "y",          "<Plug>(YankyYank)",                                                          mode = { "n", "x" },                           desc = "Yank Text" },
            { "Y",          "<Plug>(YankyYank)$",                                                         mode = { "n", "x" },                           desc = "Yank Text After Cursor" },
            { "p",          "<Plug>(YankyPutAfter)",                                                      mode = { "n", "x" },                           desc = "Put Yanked Text After Cursor" },
            { "P",          "<Plug>(YankyPutBefore)",                                                     mode = { "n", "x" },                           desc = "Put Yanked Text Before Cursor" },
            { "gp",         "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put Indented After Cursor (linewise)" },
            { "gP",         "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put Indented Before Cursor (linewise)" },
            { "zp",         '"0<Plug>(YankyPutAfter)',                                                    mode = { "n", "x" },                           desc = "Put Last Yanked Text After Cursor" },
            { "zP",         '"0<Plug>(YankyPutBefore)',                                                   mode = { "n", "x" },                           desc = "Put Last Yanked Text Before Cursor" },
            { "zgp",        '"0<Plug>(YankyPutIndentAfterLinewise)',                                      mode = { "n", "x" },                           desc = "Put Last Yanked Text After Selection" },
            { "zgP",        '"0<Plug>(YankyPutIndentBeforeLinewise)',                                     mode = { "n", "x" },                           desc = "Put Last Yanked Text Before Selection" },
            { "[y",         "<Plug>(YankyCycleForward)",                                                  desc = "Cycle Forward Through Yank History" },
            { "]y",         "<Plug>(YankyCycleBackward)",                                                 desc = "Cycle Backward Through Yank History" },
            { "[p",         "<Plug>(YankyCycleForward)",                                                  desc = "Cycle Forward Through Yank History" },
            { "]p",         "<Plug>(YankyCycleBackward)",                                                 desc = "Cycle Backward Through Yank History" },
        },
        opts = {
            highlight = { timer = 150 },
        },
    },

    -- Multiple cursor to modify matched pattern
    {
        "mrbeardad/nvim-multi-cursor",
        keys = {
            {
                "<C-J>",
                function()
                    require("nvim-multi-cursor.cursor").toggle_cursor_downward()
                end,
                mode = { "n" },
                desc = "Add Cursor Downward",
            },
            {
                "<C-S-j>",
                function()
                    require("nvim-multi-cursor.cursor").cursor_down()
                end,
                mode = { "n" },
                desc = "Move Cursor Down",
            },
            {
                "<C-K>",
                function()
                    require("nvim-multi-cursor.cursor").toggle_cursor_upward()
                end,
                mode = { "n" },
                desc = "Add Cursor Upward",
            },
            {
                "<C-S-k>",
                function()
                    require("nvim-multi-cursor.cursor").cursor_up()
                end,
                mode = { "n" },
                desc = "Move Cursor Up",
            },
            {
                "<C-N>",
                function()
                    require("nvim-multi-cursor.cursor").toggle_cursor_next_match()
                end,
                mode = { "n" },
                desc = "Add Cursor Upward",
            },
            {
                "<C-S-n>",
                function()
                    require("nvim-multi-cursor.cursor").cursor_next_match()
                end,
                mode = { "n" },
                desc = "Move Cursor Up",
            },
            {
                "<Leader>mw",
                function()
                    require("nvim-multi-cursor.cursor").toggle_cursor_by_flash([[\<\w*\>]])
                end,
                mode = { "n" },
                desc = "Selection Wrod To Add Cursor",
            },
            {
                "<Leader>ms",
                function()
                    require("nvim-multi-cursor.cursor").toggle_cursor_by_flash()
                end,
                mode = { "n" },
                desc = "Selection To Add Cursor",
            },
        },
        opts = {},
    },

    {
        "vscode-neovim/vscode-multi-cursor.nvim",
        keys = {
            {
                "I",
                function()
                    require("vscode-multi-cursor").start_left({ no_selection = true })
                end,
                mode = "x",
            },
            {
                "I",
                function()
                    if #require("vscode-multi-cursor.state").cursors == 0 then
                        return "I"
                    end
                    require("vscode-multi-cursor").start_left()
                    return "<Ignore>"
                end,
                mode = "n",
                expr = true,
            },
            {
                "A",
                function()
                    require("vscode-multi-cursor").start_right({ no_selection = true })
                end,
                mode = "x",
            },
            {
                "A",
                function()
                    if #require("vscode-multi-cursor.state").cursors == 0 then
                        return "A"
                    end
                    require("vscode-multi-cursor").start_right()
                    return "<Ignore>"
                end,
                mode = "n",
                expr = true,
            },
            {
                "c",
                function()
                    if vim.fn.mode() == "\x16" then
                        require("vscode-multi-cursor").start_right()
                        require("vscode-neovim").action("deleteLeft")
                        return "<Ignore>"
                    else
                        return "c"
                    end
                end,
                mode = "x",
                expr = true,
            },
            {
                "<Leader>m",
                function()
                    return require("vscode-multi-cursor").create_cursor()
                end,
                mode = { "n", "x" },
                expr = true,
                desc = "Create Cursor",
            },
            -- {
            --   "<Leader>ms",
            --   function()
            --     if vim.api.nvim_get_hl(0, { name = "FlashLabelUnselected" }).bg == nil then
            --       vim.api.nvim_set_hl(
            --         0,
            --         "FlashLabelUnselected",
            --         { fg = "#b9bbc4", bg = "#bd0c69", italic = true, bold = true }
            --       )
            --     end
            --     keymap.toggle_cursor_by_flash()
            --   end,
            --   mode = "n",
            --   desc = "Create cursor using flash",
            -- },
            -- {
            --   "mcw",
            --   function()
            --     require("vscode-multi-cursor").flash_word()
            --   end,
            --   mode = "n",
            --   desc = "Create selection using flash",
            -- },
            {
                "<Esc>",
                function()
                    if #require("vscode-multi-cursor.state").cursors ~= 0 then
                        require("vscode-multi-cursor").cancel()
                        return "<Ignore>"
                    else
                        return "<Cmd>nohlsearch|diffupdate|normal! <C-L><CR><Esc>"
                    end
                end,
                expr = true,
                mode = "n",
                desc = "Cancel/Clear All Cursors",
            },
            {
                "[m",
                function()
                    require("vscode-multi-cursor").prev_cursor()
                end,
                mode = "n",
                desc = "Goto Prev Cursor",
            },
            {
                "]m",
                function()
                    require("vscode-multi-cursor").next_cursor()
                end,
                mode = "n",
                desc = "Goto Next Cursor",
            },
            {
                "<C-N>",
                function()
                    require("vscode-multi-cursor").addSelectionToNextFindMatch()
                end,
                mode = { "n", "x", "i" },
                desc = "Select Next Find Match",
            },
            {
                "<C-S-l>",
                function()
                    require("vscode-multi-cursor").selectHighlights()
                end,
                mode = { "n", "x", "i" },
                desc = "Select All Find Match",
            },
        },
        opts = {
            default_mappings = false,
        },
        cond = not not vim.g.vscode,
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        event = "InsertEnter",
        keys = {
            -- Do not use <tab> to expand snippets since it could conflict between jumps and expands,
            -- just expand snippets by pressing <cr> in completion menu
            {
                "<Tab>",
                function()
                    return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<Tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            {
                "<Tab>",
                function()
                    require("luasnip").jump(1)
                end,
                mode = "s",
            },
            {
                "<S-Tab>",
                function()
                    require("luasnip").jump(-1)
                end,
                mode = { "i", "s" },
            },
        },
        opts = {
            -- When to check if the current snippet was deleted
            delete_check_events = "TextChanged",
        },
    },
}
