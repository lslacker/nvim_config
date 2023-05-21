local mason_nvim_dap_setup, mason_nvim_dap = pcall(require, "mason-nvim-dap")

if not mason_nvim_dap_setup then
  return
end

mason_nvim_dap.setup({
  ensure_installed = {'python'},
})

