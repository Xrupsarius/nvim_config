return {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 15,
                open_mapping = [[<leader>t]],
                direction = "horizontal",
                shade_terminals = true,
                insert_mappings = false,
            })
        end
}
