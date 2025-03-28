local config = function()
  local cmp = require("cmp")

  cmp.setup({
      snippet = {
          expand = function(args)
              vim.fn["UltiSnips#Anon"](args.body)
          end,
      },
      window = {},
      mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), 
          ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                  cmp.select_next_item()
              elseif has_words_before() then
                  cmp.complete()
              else
                  fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
              end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function()
              if cmp.visible() then
                  cmp.select_prev_item()
              elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                  feedkey("<Plug>(vsnip-jump-prev)", "")
              end
          end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'ultisnips' },
          { name = 'buffer' },
      }),
  })

  vim.g.UltiSnipsJumpForwardTrigger = '<C-3>'
  vim.g.UltiSnipsJumpBackwardTrigger = '<C-4>'
end

return {
    'hrsh7th/nvim-cmp',
  config = config,
  event = 'InsertEnter',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'honza/vim-snippets',
  },
}
