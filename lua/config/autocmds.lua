-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
local cp = require("catppuccin.palettes").get_palette("macchiato")

local function update_ui_mode(mode)
  local mode_colors = {
    n = cp.blue,
    i = cp.green,
    v = cp.mauve,
    V = cp.mauve,
    ["\22"] = cp.mauve,
  }
  local color = mode_colors[mode] or cp.blue

  -- On change la couleur de la ligne du curseur
  vim.api.nvim_set_hl(0, "CursorLine", { bg = cp.surface0, sp = color })
  -- On change la couleur du numéro de ligne
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = color, bold = true })
end

vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    update_ui_mode(vim.v.event.new_mode:sub(1, 1))
  end,
})
