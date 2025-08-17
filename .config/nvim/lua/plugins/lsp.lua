return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- setup mason
    require('mason').setup()

    -- ensure lsp servers are installed
    require('mason-lspconfig').setup({
      ensure_installed = { 'pyright', 'clangd', 'lua_ls' },
    })

    -- setup nvim-cmp capabilities
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- configure servers
    local lspconfig = require('lspconfig')
    for _, server in ipairs({ 'pyright', 'clangd', 'lua_ls' }) do
        lspconfig[server].setup({ capabilities = capabilities })
    end
end,
}

