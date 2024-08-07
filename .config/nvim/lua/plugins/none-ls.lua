return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.credo,
      },
    })

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat File" })
  end,
}
