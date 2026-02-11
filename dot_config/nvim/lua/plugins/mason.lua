return {
    'williamboman/mason.nvim',
    dependencies = {
        { "https://github.com/neovim/nvim-lspconfig" },
        { 'williamboman/mason-lspconfig.nvim',       config = function() end },
    },
    --cmd = "Mason",
    --build = ":MasonUpdate",
    --opts_extended = {
    --"ensure_installed",
    --},
    --opts = {
    --ensure_installed = {
    --"lua-language-server",
    --},
    --},
    --config = function(_, opts)
    --require('mason').setup(opts)
    --end,
}
