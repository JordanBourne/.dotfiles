return {
  -- Mason: installs LSP binaries
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Optional: you can remove this if you want fully manual installs
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "html",
          "tailwindcss",
        },
      })
    end,
  },

  -- Core LSP (Neovim 0.11+ native API)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities =
        require("cmp_nvim_lsp").default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )

      -- Register servers (NEW API)
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
        filetypes = { "html" },
        init_options = { },
      })

      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        filetypes = { "html" },
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
      })

      -- LSP keymaps + format-on-save
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gr", require("telescope.builtin").lsp_references, "Goto References")
          map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
          map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
          map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("K", vim.lsp.buf.hover, "Hover")
          map("gd", vim.lsp.buf.definition, "Goto Definition")

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = event.buf,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })
    end,
  },

  -- cmp + LSP integration
  {
    "hrsh7th/cmp-nvim-lsp",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
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
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}

