if vim.g.did_load_which_key_plugin then
  return
end
vim.g.did_load_which_key_plugin = true

require('which-key').setup({
  preset = 'modern',

  -- delay between pressing a key and opening which-key (milliseconds)
  -- this setting is independent of vim.opt.timeoutlen
  delay = 600,
})
