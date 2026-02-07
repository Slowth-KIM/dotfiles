-- https://github.com/okuuva/auto-save.nvim

return {
  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      enabled = false,
    },
  },
}
