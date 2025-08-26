if vim.g.did_load_colorscheme then
  return
end
vim.g.did_load_colorscheme = true

-- Installed color schemes(defined in /nix/neovim-overlay.nix): tokyonight, onedark

require("tokyonight").setup({
  styles = {
    comments = { italic = false },  -- Disable italics in comments
  },
});

-- Tokyo Night has variations: night, moon, day, storm
vim.cmd.colorscheme("tokyonight-moon");
