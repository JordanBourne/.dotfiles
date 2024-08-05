return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup {
      elixirls = {
        enable = true,
        settings = elixirls.settings {
          dialyzerEnabled = true,
          enableTestLenses = false,
          fetchDeps = true,
          suggestSpecs = true,
        },
        cmd = { vim.fn.expand("~/elixir-ls/language_server.sh") },
      },
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
