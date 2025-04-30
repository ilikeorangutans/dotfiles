return {
    "junegunn/fzf.vim",
    build = "./install --all",
    keys = {
        { "ff", "<cmd>Files<cr>",   mode = "n" },
        { "ft", "<cmd>Tags<cr>",    mode = "n" },
        { "fT", "<cmd>BTags<cr>",   mode = "n" },
        { "fb", "<cmd>Buffers<cr>", mode = "n" },
        { "fc", "<cmd>Rg<cr>",      mode = "n" },
        { "fl", "<cmd>BLines<cr>",  mode = "n" },
        { "fh", "<cmd>History<cr>", mode = "n" },
    },
    dependencies = {
        "junegunn/fzf",
    }
}
