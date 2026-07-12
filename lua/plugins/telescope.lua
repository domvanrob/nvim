return {
  'nvim-telescope/telescope.nvim', version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
      },
    })

    -- load the extension after setup
    telescope.load_extension('ui-select')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope old files' })
  end
}
