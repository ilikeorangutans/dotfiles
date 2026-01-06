return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {},
    ---@diagnostic enable: missing-fields
    keys = {
        { "ff", "<cmd>FzfLua files<cr>",   mode = "n" },
        { "ft", "<cmd>FzfLua lsp_workspace_symbols<cr>",    mode = "n" },
        { "fT", "<cmd>FzfLua lsp_document_symbols<cr>",   mode = "n" },
        { "fb", "<cmd>FzfLua buffers<cr>", mode = "n" },
        { "fc", "<cmd>FzfLua grep<cr>",      mode = "n" },
        { "fl", "<cmd>FzfLua grep_curbuf<cr>",  mode = "n" },
        { "fh", "<cmd>FzfLua oldfiles<cr>", mode = "n" },
        { "fw", "<cmd>FzfLua tabs<cr>", mode = "n" },
    },
}
