-- https://github.com/catppuccin/nvim

return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {
    integrations = {
      neotree = true,
    },
    custom_highlights = function(colors)
      return {
        TabLineSel = { bg = "#32D1FD" },
        BufferLineBufferSelected = { fg = "#32D1FD" },
        DiffChange = { bg = "#a6e3a1", fg = "black" },
        DiffDelete = { bg = "#f38ba8", fg = "black" },
        Visual = { bg = "#7ec9d8", fg = "white" },
        CursorLine = { bg = colors.surface0 },
        illuminatedWordText = { bg = "#5886b0" },
        Comment = { fg = colors.flamingo },
      }
    end,
  },
}
