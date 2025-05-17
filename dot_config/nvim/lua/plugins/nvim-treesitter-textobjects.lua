return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter" --,
            -- build = ":TSUpdate",K
            --cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
            --event = { "LazyFile", "VeryLazy" }
        }
    }
}
