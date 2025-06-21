local apex_jorje_lsp_path = vim.fn.expand("$HOME/apex-jorje-lsp.jar")

return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      require("lspconfig").apex_ls.setup({
        apex_jar_path = apex_jorje_lsp_path,
        apex_enable_semantic_errors = false,
        apex_enable_completion_statistics = false,
        filetypes = {
          "cls",
          "trigger",
          "apex",
        },
        cmd = {
          "java",
          "-jar",
          apex_jorje_lsp_path,
          "apex_language_server",
        },
      })
    end,
  },
}
