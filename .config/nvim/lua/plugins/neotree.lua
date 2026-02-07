-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      {
        "<leader>r",
        function()
          local function is_neo_tree_open()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].filetype == "neo-tree" then
                return true
              end
            end
            return false
          end
          if is_neo_tree_open() then
            vim.cmd("Neotree close")
          else
            vim.cmd("Neotree reveal")
          end
        end,
        desc = "[P]Toggle current file in NeoTree",
      },
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = false },
        commands = {
          delete = function(state)
            if vim.fn.executable("trash") == 0 then
              vim.api.nvim_echo({
                { "- Trash utility not installed. Make sure to install it first\n", nil },
                { "- In macOS run `brew install trash`\n", nil },
              }, false, {})
              return
            end
            local inputs = require("neo-tree.ui.inputs")
            local path = state.tree:get_node().path
            local msg = "Are you sure you want to trash " .. path
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end
              vim.fn.system({ "trash", vim.fn.fnameescape(path) })
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,
          delete_visual = function(state, selected_nodes)
            if vim.fn.executable("trash") == 0 then
              vim.api.nvim_echo({
                { "- Trash utility not installed. Make sure to install it first\n", nil },
                { "- In macOS run `brew install trash`\n", nil },
              }, false, {})
              return
            end
            local inputs = require("neo-tree.ui.inputs")
            local function GetTableLen(tbl)
              local len = 0
              for _ in pairs(tbl) do
                len = len + 1
              end
              return len
            end
            local count = GetTableLen(selected_nodes)
            local msg = "Are you sure you want to trash " .. count .. " files?"
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end
              for _, node in ipairs(selected_nodes) do
                vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
              end
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,
        },
      },
    },
  },
}
