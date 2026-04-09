-- Exit if tinymist isn't available
if vim.fn.executable('tinymist') ~= 1 then
  return
end

vim.lsp.config["tinymist"] = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
    }
}

vim.lsp.enable({"tinymist"})
