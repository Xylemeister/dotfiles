-- return {
--    'neovim/nvim-lspconfig',
--   dependencies = {
--     'williamboman/mason.nvim',
--     'williamboman/mason-lspconfig.nvim',
--     'hrsh7th/nvim-cmp',
--     'hrsh7th/cmp-nvim-lsp',
--   },
--   config = function() -- setup mason
--     require('mason').setup()
--
--     -- ensure lsp servers are installed
--     require('mason-lspconfig').setup({
--       ensure_installed = { 'pyright', 'clangd', 'lua_ls' },
--     })
--
--     -- setup nvim-cmp capabilities
--     local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--     -- configure servers
--     local lspconfig = require('lspconfig')
--     for _, server in ipairs({ 'pyright', 'clangd', 'lua_ls' }) do
--         lspconfig[server].setup({ capabilities = capabilities })
--     end
--
--     require('lspconfig').clangd.setup{
--        cmd = { "clangd", "--compile-commands-dir=build" },
--     }
-- end,
-- }


return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "clangd", "gopls", "pyright", "jdtls"},
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "mfussenegger/nvim-jdtls",
    },
    -- Minimal cmp setup (with Tab navigation)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP completions
            "hrsh7th/cmp-buffer",   -- buffer words
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
                    ["<C-Space>"] = cmp.mapping.complete(),            -- Ctrl+Space to trigger
                    ["<Tab>"] = cmp.mapping.select_next_item(),        -- Tab → next suggestion
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),      -- Shift+Tab → prev suggestion
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                }),
            })


            -- Tell LSP servers to use cmp for completion
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            -- lspconfig.clangd.setup({
            --     capabilities = capabilities,
            --     on_attach = function(_, bufnr)
            --         -- Format on save
            --         vim.api.nvim_create_autocmd("BufWritePre", {
            --             buffer = bufnr,
            --             callback = function()
            --                 vim.lsp.buf.format()
            --             end,
            --         })
            --     end,
            -- }) 
            local on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
            end

            lspconfig.clangd.setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })


            lspconfig.gopls.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                gopls ={
                  gofumpt = true,
                  analyses = {unusedparams = true},
                  staticcheck = true,
                  usePlaceholders = true,
                  completeUnimported = true,
                },
              },
            })

            lspconfig.pyright.setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })

        end,
    },
}

