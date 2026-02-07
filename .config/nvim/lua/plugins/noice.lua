-- https://github.com/folke/noice.nvim

return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      messages = {
        enabled = true,
        view = "mini",
        view_error = "mini",
        view_warn = "mini",
        view_history = "mini",
        view_search = "mini",
      },
      notify = {
        enabled = true,
        view = "mini",
      },
      lsp = {
        message = {
          enabled = true,
          view = "mini",
        },
      },
      views = {
        mini = {
          timeout = 7000,
          align = "center",
          position = {
            row = "95%",
            col = "100%",
          },
        },
      },
    },
  },
}
