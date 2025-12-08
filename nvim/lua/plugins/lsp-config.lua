return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      -- local coq = require('coq')
      -- local capabilities = coq.lsp_ensure_capabilities()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.diagnostic.config({
        virtual_text = false,
        float = {
          border = 'rounded',
        },
      })

      -- Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnotics = {
              -- turn off lsp notification when vim is called
              globals = { 'vim' }
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data
            telemetry = {
              enable = false,
            },
          },
        },
        capabilities = capabilities,
      })

      -- PHP
      lspconfig.phpactor.setup({
        capabilities = capabilities,
        init_options = {
            ['language_server_phpstan.enabled'] = true,
            -- ['phpactor.project.workspace'] = {
            --     "~/Documents/Code/wp-dev/wp-includes/",
            -- },
        },
      })

      -- lspconfig.phpstan.setup({})

      -- TS/JS
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })

      -- Python
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })

      -- C/C++
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      -- Java
      -- Handled in java.lua

      -- HTML/CSS
      lspconfig.html.setup({
        capabilities = capabilities,
      })
    end,
  },
  -- {
  --   'mfussenegger/nvim-jdtls',
  -- },
}
