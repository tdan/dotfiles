local utils = require('utils')
local is_plugin_availabe = utils.is_plugin_available

-- NeoTree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Explorer' })
vim.keymap.set('n', '<leader>o',
  function()
    if vim.bo.filetype == 'neo-tree' then
      vim.cmd.wincmd 'p'
    else
      vim.cmd.Neotree 'focus'
    end
  end,
  { desc = 'Toggle Explorer Focus' }
)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files (incl. hidden)' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find in buffers' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').lsp_references, { desc = 'Find references (LSP)' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').lsp_incoming_calls, { desc = 'Find incoming calls (LSP)' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_outgoing_calls, { desc = 'Find outgoing calls (LSP)' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, { desc = 'Document Symbols' })
vim.keymap.set('n', '<leader>fn', function ()
  builtin.find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'Find Neovim Config files' })
vim.keymap.set('n', '<leader><leader>', '<esc><cmd>lua require("telescope").extensions.recent_files.pick()<cr>', { desc = 'Telescope open recent files' })
vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>', { desc = 'Telescope undo' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope Help' })

-- LSP
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
vim.keymap.set('n', 'ge', vim.diagnostic.open_float, { desc = 'Open diagnostic window' })
vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename under cursor' })

-- Nvim-dap
vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint, { desc = 'Toggle breakpoint'})

-- Null(None)-ls
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Code Format' })

-- Trouble.nvim
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = 'Toggle Trouble' })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = 'Workspace diagnostics' })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = 'Document diagnostics' })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = 'Quickfix' })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = 'LOC list' })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = 'LSP Reference' })

-- Comment.nvim
if is_plugin_available('Comment.nvim') then
  vim.keymap.set("n", "<leader>/", function() require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end, { desc = 'Toggle comment line' })
  vim.keymap.set('v', '<leader>/', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>', { desc = 'Toggle comment for selection' })
end

-- Todo-comments.nvim
if is_plugin_available('todo-comments.nvim') then
  vim.keymap.set(
      'n', ']t',
      function() require('todo-comments').jump_next() end,
      { desc = 'Next todo comment' }
  )
  vim.keymap.set(
      'n', '[t',
      function() require('todo-comments').jump_prev() end,
      { desc = 'Previous todo comment' }
  )
end

-- Session-manager
vim.keymap.set('n', '<leader>sl', '<esc><cmd>SessionManager load_last_session<cr>', { desc = 'Load last session' })
vim.keymap.set('n', '<leader>sC', '<esc><cmd>SessionManager load_current_dir_session<cr>', { desc = 'Load last session (current dir)' })
vim.keymap.set('n', '<leader>sL', '<esc><cmd>SessionManager load_session<cr>', { desc = 'Select and load session' })
vim.keymap.set('n', '<leader>ss', '<esc><cmd>SessionManager save_current_session<cr>', { desc = 'Save session' })
vim.keymap.set('n', '<leader>sd', '<esc><cmd>SessionManager delete_session<cr>', { desc = 'Select and delete session' })

-- nvim-ufo
if is_plugin_available('ufo') then
  vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
  vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
end
