return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  keys = {
    { "<leader>pv", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = "right",
      width = 40,
      auto_expand_width = true,
    },
    filesystem = {
      follow_current_file = {
        enabled = true
      }
    }
  },
}

