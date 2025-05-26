-- Utiliser des tabulations au lieu d'espaces
vim.opt.expandtab = false

-- Définir la largeur d'une tabulation en termes de colonnes
vim.opt.tabstop = 4

-- Définir la largeur d'une indentation
vim.opt.shiftwidth = 4

-- Utiliser des tabulations pour l'indentation automatique
vim.opt.smarttab = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax", "catpuccin" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Fonction pour exécuter l'alias de formatage
local function format_c_file()
  -- Utiliser l'alias "form" pour formater le fichier en cours
  print("Formatting C file...")
  local cmd = "python3 -m c_formatter_42 " .. vim.fn.expand("%:p")
  print("Command:", cmd)
  -- Exécuter la commande silencieusement
  vim.cmd("silent ! " .. cmd)
end

-- Créer une autocommand pour formater les fichiers .c après leur sauvegarde
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.c", "*.h" },
  callback = format_c_file,
})

vim.keymap.set("n", "<leader>rn", ":IncRename ")
