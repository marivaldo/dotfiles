return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = "ivy",
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
        buffers = {
          current = false,
          sort_lastused = true,
        },
      },
    },
  },
}
