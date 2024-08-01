-- vim.bo.comments = ':---,:--'

local rust_ls_cmd = 'rust-analyzer'

-- Check if rust-analyzer is available
if vim.fn.executable(rust_ls_cmd) ~= 1 then
  return
end

local root_files = {
  'Cargo.toml',
  'Cargo.lock',
  '.git',
}

vim.lsp.start {
  name = 'rustls',
  cmd = { rust_ls_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    -- Lua = {
    --   runtime = {
    --     version = 'LuaJIT',
    --   },
    --   diagnostics = {
    --     -- Get the language server to recognize the `vim` global, etc.
    --     globals = {
    --       'vim',
    --       'describe',
    --       'it',
    --       'assert',
    --       'stub',
    --     },
    --     disable = {
    --       'duplicate-set-field',
    --     },
    --   },
    --   workspace = {
    --     checkThirdParty = false,
    --   },
    --   telemetry = {
    --     enable = false,
    --   },
    --   hint = { -- inlay hints (supported in Neovim >= 0.10)
    --     enable = true,
    --   },
    -- },
  },
}
