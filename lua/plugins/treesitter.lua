return {
    {
      "nvim-treesitter/nvim-treesitter",
       dependencies = {
           "nvim-treesitter/nvim-treesitter-refactor",
       },
       build = ":TSUpdate",
       config = function()
         require("nvim-treesitter.configs").setup({
           ensure_installed = { "lua", "python", "rust", "javascript", "html", "css", "json", "java", "sql", "dockerfile" },
           highlight = { enable = true },
           refactor = {
               highlight_current_scope = {enable = true},
           },
           indent = { enable = true },
         })
       end,
      },
}

