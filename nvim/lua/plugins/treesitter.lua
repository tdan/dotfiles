return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { },
    build = ':TSUpdate',
    config = function()
      local config = require('nvim-treesitter.configs')
      config.setup({
        highlight = {
          additional_vim_regex_highlighting = false,
          enable = true,
        },
        indent = { enable = true },
        sync_install = false,
        auto_install = true,
        modules = {},
        ensure_installed = { 'lua' },
        ignore_install = {},
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
}
