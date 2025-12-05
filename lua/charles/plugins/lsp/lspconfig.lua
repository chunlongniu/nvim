-- lua/charles/plugins/lsp/lspconfig.lua
return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"nvim-telescope/telescope.nvim", -- Required for the Telescope keymaps (gd, gi, etc.)
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		local keymap = vim.keymap
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		require("neodev").setup()

		-- 1. Global On_Attach Keymaps & Autocmd
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Keymaps (these are buffer-local and generally safe)
				keymap.set(
					"n",
					"gR",
					"<cmd>Telescope lsp_references<CR>",
					{ desc = "Show LSP references", buffer = ev.buf }
				)
				keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
				keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					{ desc = "Show LSP definitions", buffer = ev.buf }
				)
				keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					{ desc = "Show LSP implementations", buffer = ev.buf }
				)
				keymap.set(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					{ desc = "Show LSP type definitions", buffer = ev.buf }
				)
				keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "Code actions", buffer = ev.buf }
				)
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", buffer = ev.buf })
				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					{ desc = "Show line diagnostics", buffer = ev.buf }
				)
				keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = ev.buf })
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", buffer = ev.buf })

				-- 🛑 ERROR FIX: Check if the client is valid before accessing properties like .name
				if ev.client and ev.client.name then
					-- Client-specific autocmds
					if ev.client.name == "svelte" then
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Check client again inside callback just in case the client disconnects
								if ev.client and ev.client.notify then
									ev.client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
								end
							end,
							buffer = ev.buf,
						})
					end
				end
			end,
		})

		-- 2. Diagnostics Setup
		vim.diagnostic.config({
			-- 1. Global display options
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false, -- Don't show diagnostics while typing

			-- 2. Define the sign text/icons
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "", -- The 'Error' icon
					[vim.diagnostic.severity.WARN] = "", -- The 'Warning' icon
					[vim.diagnostic.severity.INFO] = "", -- The 'Info' icon
					[vim.diagnostic.severity.HINT] = "💡", -- The 'Hint' icon
				},
				-- Set 'active = true' to enable the signs handler globally
				active = true,
			},

			-- 3. Floating window options (on hover)
			float = {
				border = "single",
				source = "always",
				header = "",
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = false,
			float = { source = "always", border = "rounded" },
		})

		-- 3. Core Server Configuration & Enabling
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		local installed_servers = mason_lspconfig.get_installed_servers()

		for _, server_name in ipairs(installed_servers) do
			local opts = {}

			if server_name == "lua_ls" then
				opts.settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						completion = { callSnippet = "Replace" },
						workspace = {
							library = {
								vim.fn.expand("$VIMRUNTIME/lua"),
								vim.fn.stdpath("config") .. "/lua",
							},
						},
					},
				}
			elseif server_name == "emmet_ls" then
				opts.filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"svelte",
					"vue",
				}
			elseif server_name == "clangd" then
				opts.cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
				}
			elseif server_name == "gopls" then
				opts.settings = {
					gopls = {
						gofumpt = true,
						staticcheck = true,
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				}
			elseif server_name == "rust_analyzer" then
				opts.settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = { command = "clippy" },
						inlayHints = { chainingHints = true, typeHints = true, parameterHints = true },
					},
				}
			elseif server_name == "pyright" then
				opts.settings = {
					python = { analysis = { typeCheckingMode = "standard", diagnosticMode = "workspace" } },
				}
			end

			-- 🛑 FIX: Use the native Neovim API to configure and enable the server
			vim.lsp.config(server_name, opts)
			vim.lsp.enable({ server_name })
		end

		-- 4. Python Autocmd for format + organize imports on save
		-- ──────────────────────────────────────────────────────────────────────────
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.py",
			callback = function()
				-- 1. Run organizeImports code action
				vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })

				-- 2. Run formatter (ruff) after a short delay
				vim.defer_fn(function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "ruff_lsp"
						end,
						timeout_ms = 1000,
					})
				end, 100)
			end,
		})
	end,
}
