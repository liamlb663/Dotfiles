local dap, dapui = require('dap'), require('dapui')

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Python example
dap.adapters.python = {
  type = 'executable',
  command = '/path/to/python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',  -- Use the python debugger
    request = 'launch',
    name = 'Launch file',
    program = "${file}",  -- The script you want to debug
    pythonPath = function()
      return '/path/to/python'
    end,
  },
}

-- Adapter configuration for CodeLLDB
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        -- Adjust the path to your codelldb installation
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

-- Configuration for C/C++ debugging using codelldb
dap.configurations.c = {
    {
        name = "Launch C Program",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

-- Optional: Also configure for C++
dap.configurations.cpp = dap.configurations.c
