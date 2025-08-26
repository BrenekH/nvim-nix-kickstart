if vim.g.did_load_telescope_plugin then
  return
end
vim.g.did_load_telescope_plugin = true

local telescope = require("telescope")
local actions = require("telescope.actions")

local builtin = require("telescope.builtin")

local layout_config = {
  vertical = {
    width = function(_, max_columns)
      return math.floor(max_columns * 0.99)
    end,
    height = function(_, _, max_lines)
      return math.floor(max_lines * 0.99)
    end,
    prompt_position = "bottom",
    preview_cutoff = 0,
  },
}

-- Fall back to find_files if not in a git repo
local project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

vim.keymap.set("n", "<leader>sf", project_files, { desc = "[S]earch Project [F]iles" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.lsp_document_symbols, { desc = "[S]earch [D]ocument Symbols" })
vim.keymap.set("n", "<leader>sw", builtin.lsp_dynamic_workspace_symbols, { desc = "[S]earch [W]orkspace [S]ymbols" })

telescope.setup {
  defaults = {
    path_display = {
      "truncate",
    },
    layout_strategy = "horizontal",
    layout_config = layout_config,
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-l>"] = actions.send_to_loclist,
        -- ["<esc>"] = actions.close,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
      },
      n = {
        q = actions.close,
      },
    },
    preview = {
      treesitter = true,
    },
    history = {
      path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
      limit = 1000,
    },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

telescope.load_extension("fzy_native")
-- telescope.load_extension("smart_history")
