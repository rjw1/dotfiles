return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          -- terraform-ls ignores workspace/didChangeConfiguration; settings must go via init_options
          init_options = {
            ignoreSingleFileWarning = true,
          },
        },
      },
    },
  },
}
