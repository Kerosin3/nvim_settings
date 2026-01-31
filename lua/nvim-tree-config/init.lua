-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.cmd('nnoremap <space>w :NvimTreeToggle<CR>')
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  

  -- custom mappings
  -- <C-t> open ion new tab
  vim.keymap.set('n', '<->', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set("n", "<C-c>", ":NvimTreeClose<CR>")
  vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })   -- Открыть/скрыть
  vim.keymap.set('n', '<C-w>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })    -- Фокус на дерево
  vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })    -- Фокус на file
end



require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  sort_by = "extension",
  on_attach = my_on_attach,
  view = {
    adaptive_size = true,
    },
 git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },
  renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        highlight_modified = "all",
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            modified = "●",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
      },
   filters = {
    dotfiles = false,
  },
})
