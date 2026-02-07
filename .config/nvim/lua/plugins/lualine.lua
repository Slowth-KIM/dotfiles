-- https://github.com/nvim-lualine/lualine.nvim
-- Statusline configuration (color dependency removed, uses fixed Catppuccin Mocha colors)

local icons = LazyVim.config.icons

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local fg_color = "#cdd6f4" -- Catppuccin Mocha text
    local hostname_bg = "#89b4fa" -- Catppuccin Mocha blue

    -- Configure lualine_c with diagnostics
    opts.sections.lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
    }

    -- Configure lualine_y with progress and location
    opts.sections.lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    }

    -- Disable lualine_z (time)
    opts.sections.lualine_z = {}

    -- Add hostname to lualine_x
    table.insert(opts.sections.lualine_x, 1, {
      function()
        return vim.fn.hostname()
      end,
      color = { fg = fg_color, bg = hostname_bg, gui = "bold" },
      separator = { left = "", right = "" },
      padding = 0,
    })
  end,
}
