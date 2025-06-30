return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
    {
      'luukvbaal/statuscol.nvim',
      config = function()
        local builtin = require('statuscol.builtin')
        require('statuscol').setup({
          relculright = true,
          segments = {
            { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
            { text = { '%s'}, click = 'v:lua.ScSa' },
            { text = { builtin.lnumfunc, ' '}, click = 'v:lua.ScLa' },
          }
        })
      end,
    }
  },
  event = 'BufReadPost',
  config = function()
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
      close_fold_kinds_for_ftt = { 'imports', 'comment' },
    })
  end
}
