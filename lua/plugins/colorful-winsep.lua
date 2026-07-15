return {
  "nvim-zh/colorful-winsep.nvim",
  config = true,
  event = { "WinLeave" },
  opts = {
    border = "single",
    animate = {
      enabled = false,
      -- enabled = "shift",
    },
    colors = { "#89b4fa" },
  },
}
