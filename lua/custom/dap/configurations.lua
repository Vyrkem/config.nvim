local dap = require 'dap'

dap.configurations.c = {
  {
    name = 'Debug (OpenOCD)',
    type = 'cortex-debug',
    request = 'launch',
    servertype = 'openocd',

    executable = vim.fn.getcwd() .. '/build/firmware.elf',

    -- svdFile = vim.fn.getcwd() .. "/svd/stm32h7x.svd",

    configFiles = {
      'interface/stlink.cfg',
      'target/stm32h7x.cfg',
    },
  },
}

dap.configurations.cpp = dap.configurations.c
