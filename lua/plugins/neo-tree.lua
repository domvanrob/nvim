return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      width = 40,
      auto_expand_width = true,
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
    close_if_last_window = true,
  },
}
