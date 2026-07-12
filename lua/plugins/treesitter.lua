return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate', -- Fixed capitalization and added the missing comma here
  config = function()
    local treesit = require('nvim-treesitter')
    treesit.setup { }
    treesit.install { 'lua', 'javascript' }

    -- Your original autocmd logic preserved
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' }, 
      callback = function() vim.treesitter.start() end,
    })

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
}
