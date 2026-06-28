require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ruff" }
-- local servers = { "html", "cssls", "pug_lsp", "pylyzer", "pyright", "ruff" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
