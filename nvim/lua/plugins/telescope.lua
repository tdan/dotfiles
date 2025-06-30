return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          recent_files = {
            only_cwd = true,
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          }
        },
      }
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extentions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {}
          }
        }
      })

      require('telescope').load_extension('ui-select')
    end,
  },
  {
    'smartpde/telescope-recent-files',
    config = function ()
      require('telescope').load_extension('recent_files')
    end,
  },
}
