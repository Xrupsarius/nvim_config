return {
  -- Lightbulb для code actions
  {
    "kosayoda/nvim-lightbulb",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true }, -- авто отображение лампочки
      })
    end,
  },

  -- Trouble для панели ошибок
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
      -- горячие клавиши
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" })
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics" })
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics" })
    end,
  },
}

