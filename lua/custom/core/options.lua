-- mets tes options ici (exemple)
vim.opt.number = true
vim.opt.relativenumber = true

-- Xilinx Vivado constraint files are Tcl with extra commands
vim.filetype.add({
  extension = {
    xdc = 'tcl',
    sdc = 'tcl', -- Synopsys Design Constraints, même format Tcl
  },
})
