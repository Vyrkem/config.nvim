local function start_opencode_if_not_running()
  -- essaie de se connecter rapidement
  local ok = vim.fn.system 'nc -z 127.0.0.1 4096' == ''
  if not ok then
    vim.fn.jobstart({ 'opencode', 'serve', '--port=4096' }, {
      detach = true,
    })
  end
end

start_opencode_if_not_running()
