return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          rosewater = "#ffc0b9",
          flamingo = "#f5aba3",
          pink = "#f592d6",
          mauve = "#c0afff",
          red = "#ea746c",
          maroon = "#ff8595",
          peach = "#fa9a6d",
          yellow = "#ffe081",
          green = "#66d175",
          teal = "#47deb4",
          sky = "#00d5ed",
          sapphire = "#00dfce",
          blue = "#00baee",
          lavender = "#97becf",
          text = "#cccccc",
          subtext1 = "#bbbbbb",
          subtext0 = "#aaaaaa",
          overlay2 = "#999999",
          overlay1 = "#888888",
          overlay0 = "#777777",
          surface2 = "#666666",
          surface1 = "#555555",
          surface0 = "#444444",
          base = "#202022",
          mantle = "#222222",
          crust = "#333333",
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
