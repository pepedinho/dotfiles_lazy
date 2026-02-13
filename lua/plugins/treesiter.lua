return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "rust",
        "ron",
        "toml",
        "lua",
        "vim",
      },
      highlight = {
        enable = true, -- C'est cette ligne qui active la coloration riche
      },
    },
  },
}
