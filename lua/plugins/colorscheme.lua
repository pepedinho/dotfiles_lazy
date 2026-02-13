return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          semantic_tokens = true,
        },
        -- C'EST ICI qu'il faut mettre les highlights
        custom_highlights = function(colors)
          return {
            CursorNormal = { bg = colors.blue, fg = colors.base },
            CursorInsert = { bg = colors.green, fg = colors.base },
            CursorVisual = { bg = colors.mauve, fg = colors.base },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
