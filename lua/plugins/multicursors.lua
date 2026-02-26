return {
  "mg979/vim-visual-multi",
  init = function()
    vim.g.VM_default_mappings = 0

    vim.g.VM_maps = {
      ["Find Under"] = "<leader><CR>", -- Remplace Ctrl+n (sélectionne le mot)
      ["Find Subword Under"] = "<leader><CR>",
      ["Select All"] = "<C-M-n>", -- Tu peux garder ou changer les autres
      ["Skip Region"] = "<C-x>",
    }
  end,
}
