return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- load on startup
    priority = 1000, -- load before other plugins
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
}
