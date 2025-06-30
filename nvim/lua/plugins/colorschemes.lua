return {
  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function ()
  --     vim.cmd('colorscheme kanagawa-wave')
  --   end
  -- },
  -- {
  --   'sainnhe/edge',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Config
  --     vim.g.edge_style = 'neon'
  --     vim.g.edge_better_performance = 1
  --
  --     -- Setup Lualine theme
  --     require('lualine').setup {
  --       options = {
  --         theme = 'edge'
  --       },
  --     }
  --
  --     vim.cmd('colorscheme edge')
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('lualine').setup {
  --       options = {
  --         theme = 'tokyonight'
  --       },
  --     }
  --
  --     vim.cmd('colorscheme tokyonight-moon')
  --   end,
  -- },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
      require('lualine').setup({
        options = { theme = 'nordic' }
      })
    end,
  },
}
