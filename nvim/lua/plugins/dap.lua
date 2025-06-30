vim.fn.sign_define('DapBreakpoint',
    {
        text = '🔴',
        texthl = 'DapBreakpointSymbol',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint'
    })
vim.fn.sign_define('DapStopped',
    {
        texthl = 'DapStoppedSymbol',
        linehl = 'CursorLine',
        numhl = 'DapBreakpoint'
    })

return {
    {
        'mfussenegger/nvim-dap',
    },
  {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function ()
            local dap, dapui = require('dap'), require('dapui')

            dap.adapters.gdb = {
                type = 'executable',
                command = 'gdb',
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
            }
            dap.configurations.c = {
                {
                    name = 'Launch',
                    type = 'gdb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtBeginningOfMainSubprogram = false,
                },
                {
                    name = "Select and attach to process",
                    type = "gdb",
                    request = "attach",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    pid = function()
                        local name = vim.fn.input('Executable name (filter): ')
                        return require("dap.utils").pick_process({ filter = name })
                    end,
                    cwd = '${workspaceFolder}'
                },
                {
                    name = 'Attach to gdbserver :1234',
                    type = 'gdb',
                    request = 'attach',
                    target = 'localhost:1234',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}'
                },
            }
            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rust = dap.configurations.c

            dap.configurations.java = {
                {
                    type = 'java',
                    request = 'launch',
                    name = 'Launch Java program',
                    program = "",
                },
            }
            dap.configurations.typescript = {
                type = "pwa-node",
                request = "launch",
                name = "Launch current file in node process",
                program = "${file}",
            }
            dap.configurations.javascript = dap.configurations.typescript

            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function ()
            require('nvim-dap-virtual-text').setup()
        end
    },
}
