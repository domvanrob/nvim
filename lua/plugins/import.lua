return {
  "piersolenski/import.nvim",
  dependencies = {
    -- "nvim-telescope/telescope.nvim",
    "folke/snacks.nvim",
    -- 'ibhagwan/fzf-lua',
  },
  opts = {
    picker = "snacks",
  },
  keys = {
    {
      "<leader>ci",
      function()
        require("import").pick()
      end,
      desc = "Import",
    },
  },
}
