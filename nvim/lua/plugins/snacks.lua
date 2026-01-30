return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          win = {
            list = {
              keys = {
                ["o"] = "confirm",
              },
            },
          },
        },
      },
    },
  },
}
