-- See current buffers at the top of the editor
return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        event = "User LazyFile",
        dependencies = "nvim-tree/nvim-web-devicons",
        lazy = true,
        keys = {
            { "H",          "<Cmd>BufferLineCyclePrev<CR>",            desc = "Prev Buffer" },
            { "L",          "<Cmd>BufferLineCycleNext<CR>",            desc = "Next Buffer" },
            { "<Leader>`",  "<Cmd>BufferLinePick<CR>",                 desc = "Pick Buffer" },
            { "<Leader>bH", "<Cmd>BufferLineMovePrev<CR>",             desc = "Move Buffer To Prev" },
            { "<Leader>bL", "<Cmd>BufferLineMoveNext<CR>",             desc = "Move Buffer To Next" },
            { "<Leader>bD", "<Cmd>BufferLineSortByDirectory<CR>",      desc = "Sort By Directory" },
            { "<Leader>bE", "<Cmd>BufferLineSortByExtension<CR>",      desc = "Sort By Extensions" },
            { "<Leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
            { "<Leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Unpinned Buffers" },
            { "<Leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete Other Buffers" },
            { "<Leader>bl", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers To The Right" },
            { "<Leader>bh", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers To The Left" },
        },
    },
}
