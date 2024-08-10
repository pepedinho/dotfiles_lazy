return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {},
      clangd = { -- Ajouter clangd ici
        -- Désactiver les modifications de texte supplémentaires
        init_options = {
          clangdFileStatus = true, -- Option pour afficher le statut du fichier (peut être modifiée selon vos besoins)
          completion = {
            enableAdditionalTextEdit = false, -- Désactiver les modifications de texte supplémentaires
          },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--header-insertion=never",
        },
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = false
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          elseif client.name == "clangd" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
