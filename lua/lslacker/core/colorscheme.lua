local status, _ = pcall(vim.cmd, "colorscheme nightfly")

if not status then
  print("Coloscheme not found!")
  return
end

