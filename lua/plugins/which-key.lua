return {
  "folke/which-key.nvim",
  dependencies = {
    { 'nvim-mini/mini.icons', version = '*' },
  },
  event = "VeryLazy",
  opts = {
    preset = "modern",
    triggers = {
      { "<leader>", mode = { "n", "v" } },
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
