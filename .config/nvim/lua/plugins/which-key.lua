return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "ys", desc = "Add surround", mode = "n" },
      { "ds", desc = "Delete surround", mode = "n" },
      { "cs", desc = "Change surround", mode = "n" },
      { "S", desc = "Add surround", mode = "v" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
