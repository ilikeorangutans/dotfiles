---@type LazySpec
return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    -- version = false,
    config = function()
        local openai = require "avante.providers.openai"
        local has_openai_key = vim.fn.executable "/opt/dev/bin/dev" == 1
        -- local has_openai_key = true
        local vendors = {}

        if vim.fn.executable('/opt/dev/bin/dev') then
            vendors["shopify-ai"] = {
                __inherited_from = 'openai',
                endpoint = "https://proxy.shopify.ai/v1",
                model = "anthropic:claude-3-5-sonnet-v2",
                api_key_name = "cmd:/opt/dev/bin/dev llm-gateway print-token --key",
                parse_curl_args = openai.parse_curl_args,
            }
        end

        require("avante").setup {
            -- @type AvanteProvider
            provider = has_openai_key and "shopify-ai" or nil,
            auto_suggestions_provider = nil, -- has_openai_key and "shopify-ai" or nil,
            vendors = vendors,
            hints = { enabled = true },
            highlights = {
                diff = {
                    incoming = "DiffChange",
                },
            },
            mappings = {
                suggestion = {
                    next = "]]",
                    prev = "[[",
                },
            },
        }
    end,
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua",      -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
