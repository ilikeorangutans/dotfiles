require("config.lazy")

vim.cmd.colorscheme 'ayu'
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.signcolumn = 'yes'
-- ?? -- vim.opt.pastetoggle = "<F11>"
vim.opt.listchars = "tab:>-,trail:·" -- Set chars to show for tabs or trailing whitespace
vim.opt.shiftround = true            -- Indentation: When at 3 spaces, >> takes to 4, not 5
vim.opt.smartcase = true             -- unless uppercase chars are given

local mason_ensure_installed = {
    'lua-language-server',
    'gopls',
    'golangci-lint',
    'golangci-lint-langserver',
    'ruby-lsp',
    'sorbet', -- not sure if that will work as expected, might have to use locally installed one
    'zls',
    'yaml-language-server',
}
require('mason').setup({})
local mr = require('mason-registry')
mr.refresh(function()
    for _, pkg in ipairs(mason_ensure_installed) do
        local p = mr.get_package(pkg)
        if not p:is_installed() then
            p:install()
        end
    end
end)

require("mason-lspconfig").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require 'lspconfig'.gopls.setup {
    capabilities = capabilities,
}
require 'lspconfig'.golangci_lint_ls.setup {}
require 'lspconfig'.zls.setup {}
require 'lspconfig'.sorbet.setup {}
require 'lspconfig'.rubocop.setup {
    capabilities = capabilities,
}
require 'lspconfig'.ruby_lsp.setup {
    capabilities = capabilities,
}
require 'lspconfig'.yamlls.setup {}


require 'lspconfig'.lua_ls.setup {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

vim.diagnostic.config {
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
}

vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'jump to previous diagnostic' })
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'jump to next diagnostic' })
-- not sure what this one is supposed to do but it's not working?
-- vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.open_float()<CR>',
--    { desc = 'jump to next diagnostic' })
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.setloclist()<CR>',
    { desc = 'send diagnostics to location list' })

-- automatically format on safe. should probably check if the lsp has support for formatting?
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
        vim.lsp.buf.format { async = false }
    end
})

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'go', 'ruby', 'zig', 'make', 'lua', 'regex', 'yaml' },
    auto_install = true,
    highlight = {
        enable = true,
    },
}
