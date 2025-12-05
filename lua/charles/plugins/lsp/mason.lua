-- lua/charles/plugins/lsp/mason.lua
return {
	"williamboman/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	lazy = false,
	priority = 1000,
	config = function()
		-- import mason
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- ONLY setup mason-lspconfig to install servers
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"gopls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"ruff",
				"clangd",
				"rust_analyzer",
				"jsonls",
				"yamlls",
				"marksman",
				"ruff",
			},
			automatic_installation = true,
			automatic_enable = false,
		})

		-- Setup tool installer
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"isort",
				"black",
				"eslint_d",
				"markdownlint",
				"yamllint",
				"jsonlint",
				-- C++
				"cpptools",
				"clang-format",
				-- Golang
				"gofumpt",
				"goimports-reviser",
				"golines",
				-- Rust
				"rustfmt",
				-- Python
				"isort",
				"ruff",
				"black",
				"debugpy",
				-- Lua
				"stylua",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
