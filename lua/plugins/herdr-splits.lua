return {
  "lmilojevicc/herdr-splits.nvim",
  cond = vim.env.HERDR_ENV == "1",
  event = "VeryLazy",

  opts = {
    neovim_amount = 2,

    nav_keys = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
    },

    -- Keys Herdr forwards into Neovim.
    resize_keys = {
      left = "<M-h>",
      down = "<M-j>",
      up = "<M-k>",
      right = "<M-l>",
    },
  },

  keys = {
    {
      "<C-h>",
      function()
        require("herdr-splits").move_cursor_left()
      end,
      desc = "Go to Left Window",
    },
    {
      "<C-j>",
      function()
        require("herdr-splits").move_cursor_down()
      end,
      desc = "Go to Lower Window",
    },
    {
      "<C-k>",
      function()
        require("herdr-splits").move_cursor_up()
      end,
      desc = "Go to Upper Window",
    },
    {
      "<C-l>",
      function()
        require("herdr-splits").move_cursor_right()
      end,
      desc = "Go to Right Window",
    },

    -- These are the keys Herdr sends into Neovim.
    {
      "<M-h>",
      function()
        require("herdr-splits").resize_left()
      end,
      desc = "Resize Window Left",
    },
    {
      "<M-j>",
      function()
        require("herdr-splits").resize_down()
      end,
      desc = "Resize Window Down",
    },
    {
      "<M-k>",
      function()
        require("herdr-splits").resize_up()
      end,
      desc = "Resize Window Up",
    },
    {
      "<M-l>",
      function()
        require("herdr-splits").resize_right()
      end,
      desc = "Resize Window Right",
    },
  },
}
