if vim.g.did_load_typst_preview_plugin then
  return
end
vim.g.did_load_typst_preview_plugin = true

require('typst-preview').setup({
  -- Provide the path to binaries for dependencies.
  -- Setting this will skip the download of the binary by the plugin.
  -- Warning: Be aware that your version might be older than the one
  -- required.
  dependencies_bin = {
    tinymist = "tinymist",
    websocat = "websocat",
  },
})
