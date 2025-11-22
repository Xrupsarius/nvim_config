return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason setup
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "rust_analyzer",
          "jdtls",
          "ts_ls",        -- заменяет tsserver
          "volar",
          "dockerls",
          "sqlls",
        },
      })

      -- LSP capabilities и общие настройки
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end

        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
      end

      local servers = {
        pyright = {},
        rust_analyzer = {},
        jdtls = {},
        ts_ls = {},
        volar = {},
        dockerls = {},
        sqlls = {},
      }

      for name, opts in pairs(servers) do
        opts.capabilities = capabilities
        opts.on_attach = on_attach
        lspconfig[name].setup(opts)
      end
    end,
  },
}

