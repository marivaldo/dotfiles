return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      enabled = true,
      top_down = true,
    },
    picker = {
      layouts = {
        ivy_bottom = {
          reverse = true,
          layout = {
            box = "vertical",
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.4,
            border = "top",
            title = " {title} {live} {flags}",
            title_pos = "left",
            {
              box = "horizontal",
              { win = "list", border = "none" },
              { win = "preview", title = " {preview} ", width = 0.55, border = "left" },
            },
            { win = "input", height = 1, border = "top" },
          },
        },
      },
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          win = {
            list = {
              keys = {
                ["o"] = "confirm",
              },
            },
          },
        },
        files = {
          hidden = true,
          ignored = true,
          layout = "ivy_bottom",
        },
        buffers = {
          current = false,
          sort_lastused = true,
          layout = "ivy_bottom",
        },
        grep = {
          layout = "ivy_bottom",
        },
      },
    },
  },
}
