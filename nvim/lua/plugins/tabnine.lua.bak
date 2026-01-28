return {
  {
    'codota/tabnine-nvim',
    build = './dl_binaries.sh',
    config = function ()
      require('tabnine').setup({
        disable_auto_comment = true,
        accept_keymap = '<C-]>',
        dismiss_keymap = '<C-[>',
        debounce_ms = 800,
        suggestion_color = { gui = '#808080', cterm = 244 },
        exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
        log_file_path = nil, -- absolute path to Tabnine log file
      })

      require('lualine').setup({
        -- tabline = {
        --   lualine_a = {},
        --   lualine_b = { },
        --   lualine_c = { },
        --   lualine_x = {},
        --   lualine_y = {},
        --   lualine_z = {},
        -- },
        sections = { lualine_c = { 'lsp_progress' }, lualine_x = { 'tabnine' }},
      })

      require('tabnine.status').status()

    end
  }
}
