return {
  'numToStr/Comment.nvim',
  opts = {
    -- Add any option here
  },
  lazy = false,
  config = function()
    require('Comment').setup()
  end
}
