require("nvim-lsp-installer").setup {}
local nvim_lsp = require("lspconfig")
local saga = require("lspsaga")
local formatter = require('formatter')

-- PYRIGHT
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv from pipenv in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  on_init = function(client)
      client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end
}

-- TSSERVER
nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    -- Disable tsserver formatting as prettier/eslint does that.
    client.resolved_capabilities.document_formatting = false
  end
}

-- TSSERVER
nvim_lsp.clojure_lsp.setup {
  on_attach = function(client, bufnr)
    -- Disable tsserver formatting as prettier/eslint does that.
    client.resolved_capabilities.document_formatting = false
  end
}

-- NULL-LS
local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier,
  formatting.black,
  diagnostics.flake8,
}

null_ls.setup( {
  sources = sources
})
-- local filetypes = {
--   typescript = "eslint",
--   typescriptreact = "eslint",
--   python = "flake8",
-- }

-- local linters = {
--   eslint = {
--     sourceName = "/Users/luanm/Workspaces/java/calculation-engine/infra/cdk/calculation-engine/node_modules/.bin/eslint",
--     command = "/Users/luanm/Workspaces/java/calculation-engine/infra/cdk/calculation-engine/node_modules/.bin/eslint",
--     rootPatterns = {".eslintrc", "package.json"},
--     debouce = 100,
--     args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json", "--ext", "ts"},
--     parseJson = {
--       errorsRoot = "[0].messages",
--       line = "line",
--       column = "column",
--       endLine = "endLine",
--       endColumn = "endColumn",
--       message = "${message} [${ruleId}]",
--       security = "severity"
--     },
--     securities = {[2] = "error", [1] = "warning"}
--   },
--   flake8 = {
--     command = "/Users/luanm/Workspaces/apps/for_neovim/.venv/bin/flake8",
--     args = { "--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s", "-" },
--     debounce = 100,
--     rootPatterns = { ".flake8", "setup.cfg", "tox.ini" },
--     offsetLine = 0,
--     offsetColumn = 0,
--     sourceName = "/Users/luanm/Workspaces/apps/for_neovim/.venv/bin/flake8",
--     formatLines = 1,
--     formatPattern = {
--       "(\\d+),(\\d+),([A-Z]),(.*)(\\r|\\n)*$",
--       {
--         line = 1,
--         column = 2,
--         security = 3,
--         message = 4,
--       },
--     },
--     securities = {
--       W = "warning",
--       E = "error",
--       F = "error",
--       C = "error",
--       N = "error",
--     },
--   },
  
-- }
-- nvim_lsp.diagnosticls.setup {
--   filetypes = vim.tbl_keys(filetypes),
--   init_options = {
--     filetypes = filetypes,
--     linters = linters,
--   },
-- }
-- local eslint_fmt = {
--   function()
--     return {
--       exe = "/Users/luanm/Workspaces/java/calculation-engine/infra/cdk/calculation-engine/node_modules/.bin/prettier",
--       args = {"--stdin-filepath", "expand('%:p')"},
--       stdin = true,
--     }
--   end
-- }
-- formatter.setup {
--   logging = true,
--   filetype = {
--     python = {
--       function ()
--         return {
--           exe = '/Users/luanm/Workspaces/apps/for_neovim/.venv/bin/black',
--           args = {"-"},
--           stdin = true,
--         }
--       end,
--       function ()
--         return {
--           exe = '/Users/luanm/Workspaces/apps/for_neovim/.venv/bin/isort',
--           args = {"-"},
--           stdin = true,
--         }
--       end
--     },
--     typescript = {
--       function()
--         return {
--           exe = "/Users/luanm/Workspaces/java/calculation-engine/infra/cdk/calculation-engine/node_modules/.bin/prettier",
--           args = {"--stdin-filepath", "-"},
--           stdin = true,
--         }
--       end,
--       function()
--         return {
--           exe = "/Users/luanm/Workspaces/java/calculation-engine/infra/cdk/calculation-engine/node_modules/.bin/prettier",
--           args = {"--stdin-filepath", "-"},
--           stdin = true,
--         }
--       end
--     }
--   }
-- }

