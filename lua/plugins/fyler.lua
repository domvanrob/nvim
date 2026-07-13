return { 
  'FylerOrg/fyler.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    kind = 'split_right_most',
    use_as_default_explorer = true,
    integrations = {
      icon = 'nvim_web_devicons'
    },
    ui = {
      indent_guides = true,
    },
    extensions = {
      git = { enabled = true, }
    }
  }
}
