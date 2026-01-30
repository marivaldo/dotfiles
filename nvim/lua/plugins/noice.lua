-- Info: popup default, Errors: split with focus
return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      view = "cmdline",
      format = {
        input = { view = "cmdline", icon = " " },
      },
    },
    messages = {
      view = "notify",
      view_error = "split",
      view_warn = "notify",
    },
    views = {
      split = {
        enter = true,
        size = "auto",
        win_options = {
          wrap = true,
        },
      },
    },
  },
}
