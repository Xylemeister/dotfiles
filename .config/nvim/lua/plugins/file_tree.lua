local function custom_binds(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<leader>v', api.node.open.vertical,        opts('vertical'))
  vim.keymap.set('n', '<leader>x',     api.node.open.horizontal,                  opts('horizontal'))
  vim.keymap.set('n', '<leader>t',     api.node.open.tab,                  opts('tab'))

end
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            on_attach = custom_binds, 
        }
    end,
}
