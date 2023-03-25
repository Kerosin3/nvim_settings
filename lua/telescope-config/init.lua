local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
telescope.load_extension('media_files')

local actions = require "telescope.actions"
local telescope_actions = require("telescope.actions.set")
local fixfolds = {
    hidden = true,
    attach_mappings = function(_)
        telescope_actions.select:enhance({
            post = function() vim.cmd(":normal! zx") end
        })
        return true
    end
}

vim.keymap.set('n', '<leader>df', function() telescope_find_files_in_path() end)
vim.keymap.set('n', '<leader>dd', function() telescope_live_grep_in_path() end)

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

--        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
--        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<Tab>"] = actions.toggle_selection ,
        ["<S-Tab>"] = actions.toggle_selection ,

        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection ,
        ["<S-Tab>"] = actions.toggle_selection ,
	--["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        --["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
	buffers = fixfolds,
        find_files = fixfolds,
        git_files = fixfolds,
        grep_string = fixfolds,
        live_grep = fixfolds,
        oldfiles = fixfolds
      },
  extensions = {
	 media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
         file_browser = {
      --theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
	 repo = {
      list = {
        fd_opts = {
          "--no-ignore-vcs",
        },
        search_dirs = {
          "~/my_projects",
        },
      },
    },

  },
}
require("telescope").load_extension "file_browser"
require("telescope").load_extension "repo"

_G.telescope_find_files_in_path = function(path)

	local _path = path or vim.fn.input("Dir to search files: ", "", "dir")

	if (string.len(_path)>0)
	then
	    require("telescope.builtin").find_files({search_dirs = {_path}})
	else
	    require("telescope.builtin").find_files({search_dirs = {"."}})
	end

end
_G.telescope_live_grep_in_path = function(path)
	local _path = path or vim.fn.input("Dir grep: ", "", "dir")
	if (string.len(_path)>0)
	then
	    require("telescope.builtin").live_grep({search_dirs = {_path}})
	else
	    require("telescope.builtin").live_grep({search_dirs = {"."}})
	end
end

vim.keymap.set('n', '<leader>fo', ':Telescope file_browser<CR>')
