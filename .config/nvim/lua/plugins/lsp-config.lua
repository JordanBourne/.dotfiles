return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "lua_ls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local on_attach = function(_, bufnr) end

			-- Enable the following language servers
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local lsp_options = {
				capabilities = capabilities,
				on_attach = on_attach,
				single_file_support = true,
			}

			local lspconfig = require("lspconfig")

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.elixirls.setup(vim.tbl_extend("force", lsp_options, {
				-- cmd = { "elixir-ls" },
        cmd = { "/Users/jordanbourne/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
				settings = { elixirLS = { dialyzerEnabled = true } },
			}))


			lspconfig.html.setup(vim.tbl_extend("force", lsp_options, {
				filetypes = { "html", "elixir", "eelixir", "heex", "tsx", "jsx" },
				init_options = {
					userLanguages = {
						elixir = "html-eex",
						eelixir = "html-eex",
						heex = "html-eex",
					},
				},
			}))

			lspconfig.tailwindcss.setup(vim.tbl_extend("force", lsp_options, {
				filetypes = { "html", "elixir", "eelixir", "heex", "tsx", "jsx" },
				init_options = {
					userLanguages = {
						elixir = "html-eex",
						eelixir = "html-eex",
						heex = "html-eex",
					},
				},
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								'class[:]\\s*"([^"]*)"',
								'class[=]\\s*"([^"]*)"',
							},
						},
					},
				},
			}))

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})
		end,
	},
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "elixir-ls" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
