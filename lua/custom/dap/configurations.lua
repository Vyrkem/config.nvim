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

dap.adapters.probe_rs = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'probe-rs',
    args = { 'dap-server', '--port', '${port}' },
  },
}

dap.configurations.rust = {
  {
    name = 'Debug ESP32-S3',
    type = 'probe_rs',
    request = 'launch',
    chip = 'esp32s3',
    coreConfigs = {
      {
        programBinary = 'target/xtensa-esp32s3-none-elf/debug/qr-box-s3',
      },
    },
    flashingConfig = {
      flashingEnabled = true,
    },
  },
}
