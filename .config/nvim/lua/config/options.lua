-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Winbar with hostname, buffer count, and filepath (fixed colors, no external dependency)
vim.cmd([[highlight WinBar1 guifg=#cdd6f4]])  -- Catppuccin Mocha text
vim.cmd([[highlight WinBar2 guifg=#a6adc8]])  -- Catppuccin Mocha subtext0

local function get_winbar_path()
  local full_path = vim.fn.expand("%:p")
  return full_path:gsub(vim.fn.expand("$HOME"), "~")
end

local function get_buffer_count()
  local buffers = vim.fn.execute("ls")
  local count = 0
  for line in string.gmatch(buffers, "[^\r\n]+") do
    if string.match(line, "^%s*%d+") then
      count = count + 1
    end
  end
  return count
end

local function update_winbar()
  local home_replaced = get_winbar_path()
  local buffer_count = get_buffer_count()
  vim.opt.winbar = "%#WinBar1#%m "
    .. "%#WinBar2#("
    .. buffer_count
    .. ") "
    .. "%#WinBar1#"
    .. home_replaced
    .. "%*%=%#WinBar2#"
    .. vim.fn.systemlist("hostname")[1]
end

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = update_winbar,
})

-- Conceallevel for obsidian.nvim / markdown
vim.opt.conceallevel = 2

-- Text wrapping
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"

-- Session options with localoptions for persistence
vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "tabpages",
  "winsize",
  "help",
  "globals",
  "skiprtp",
  "folds",
  "localoptions",
}

-- Disable spell check by default
vim.opt.spell = false

-- Cursor settings
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
