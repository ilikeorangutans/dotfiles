-- return {
--     "vim-test/vim-test",
--     keys = {
--         { '<leader>t', '<cmd>TestNearest<CR>', { desc = 'run nearest test' } },
--     },
--     config = function()
--         vim.cmd 'let test#strategy = "vimux"'
--     end,
--     dependencies = {
--         'preservim/vimux',
--     }
-- }
return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        { "nvim-treesitter/nvim-treesitter", branch = "main" },
        { "fredrikaverpil/neotest-golang",   version = "*" },
        "lawrence-laz/neotest-zig",
        "zidhuss/neotest-minitest",
    },
    opts = {
        adapters = {
            ["neotest-golang"] = {
                -- runner = "gotestsum",
                go_test_args = {
                    "-v",
                    "-count=1",
                    "-timeout=10s",
                    "-race"
                },
            },
            ["neotest-zig"] = {
            },
            ["neotest-minitest"] = {
            },
        },
    },
    config = function(_, opts)
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function(diagnostic)
                    -- Replace newline and tab characters with space for more compact diagnostics
                    local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)

        if opts.adapters then
            local adapters = {}
            for name, config in pairs(opts.adapters or {}) do
                if type(name) == "number" then
                    if type(config) == "string" then
                        config = require(config)
                    end
                    adapters[#adapters + 1] = config
                elseif config ~= false then
                    local adapter = require(name)
                    if type(config) == "table" and not vim.tbl_isempty(config) then
                        local meta = getmetatable(adapter)
                        if adapter.setup then
                            adapter.setup(config)
                        elseif adapter.adapter then
                            adapter.adapter(config)
                            adapter = adapter.adapter
                        elseif meta and meta.__call then
                            adapter = adapter(config)
                        else
                            error("Adapter " .. name .. " does not support setup")
                        end
                    end
                    adapters[#adapters + 1] = adapter
                end
            end
            opts.adapters = adapters
        end

        require("neotest").setup(opts)
    end,
    keys = {
        { '<leader>t',  function() require("neotest").run.run() end,                                        desc = "run nearest test" },
        { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary (Neotest)" },
        { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output (Neotest)" },
        { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel (Neotest)" },
        { "<leader>T",  function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run File (Neotest)" },
        { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end,                            desc = "Run All Test Files (Neotest)" },
        { "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "Run Last (Neotest)" },
        { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "Stop (Neotest)" },
    },
}
