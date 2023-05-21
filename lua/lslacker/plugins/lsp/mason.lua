local mason_setup, mason = pcall(require, "mason")

if not mason_setup then
	return
end

local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lspconfig_setup then
	return
end

local mason_null_ls_setup, mason_null_ls = pcall(require, "mason-null-ls")

if not mason_null_ls_setup then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"clojure_lsp",
		"tsserver",
		"pylsp",
		"jdtls",
	},
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
		"ruff",
		"black",
		"clj_kondo",
		"zprint",
	},
})

