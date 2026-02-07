-- https://github.com/nvim-telescope/telescope-frecency.nvim

return {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require("telescope").setup({
      extensions = {
        frecency = {
          show_scores = true,
          db_safe_mode = false,
          auto_validate = true,
          db_validate_threshold = 10,
          show_filter_column = false,
        },
      },
    })
    require("telescope").load_extension("frecency")
  end,
}
