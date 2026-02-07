-- https://github.com/nvim-telescope/telescope.nvim

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return {
        defaults = {
          require("telescope").setup({
            pickers = {
              find_files = {
                find_command = { "rg", "--files", "--sortr=modified" },
              },
            },
          }),
          path_display = {
            filename_first = {
              reverse_directories = true,
            },
          },
          mappings = {
            n = {
              ["d"] = require("telescope.actions").delete_buffer,
              ["q"] = require("telescope.actions").close,
            },
          },
        },
      }
    end,
    keys = {
      { "<leader>fF", "<cmd>Telescope frecency theme=ivy<cr>", desc = "Find Files" },
      {
        "<leader>ff",
        "<cmd>Telescope frecency workspace=CWD theme=ivy<cr>",
        desc = "Find Files (Root Dir)",
      },
      {
        "<leader>sG",
        function()
          require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
        end,
        desc = "Grep (cwd)",
      },
      {
        "<leader>sg",
        function()
          require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({ root = false }))
        end,
        desc = "Grep (Root Dir)",
      },
      {
        "<leader><space>",
        "<cmd>e #<cr>",
        desc = "Alternate buffer",
      },
      {
        "<leader>tl",
        "<cmd>TodoTelescope keywords=TODO<cr>",
        desc = "[P]TODO list (Telescope)",
      },
      {
        "<leader>ta",
        "<cmd>TodoTelescope keywords=PERF,HACK,TODO,NOTE,FIX<cr>",
        desc = "[P]TODO list ALL (Telescope)",
      },
    },
  },
}
