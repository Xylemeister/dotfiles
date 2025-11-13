local jdtls = require("jdtls")

-- Find project root
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == nil then
  return
end

local on_attach = function(_, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

-- Workspace directory (one per project)
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Base config
local config = {
  cmd = { "jdtls", "-data", workspace_dir },
  root_dir = root_dir,
  capabilities = capabilities,
  on_attach = on_attach,

  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
    },
  },
}

jdtls.start_or_attach(config)

