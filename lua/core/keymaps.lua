local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<C-w>", ":w!<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>m", ":nohlsearch<CR>", opts)
map("n", "<ESC>", ":nohl<CR>", opts)

map({"n", "v" }, "H", "^", opts)
map({"n", "v" }, "L", "$", opts)

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

map("n", "<leader>f", function() vim.lsp.buf.format() end, opts)

map("n", "<M-i>", function() vim.diagnostic.open_float() end, {desc = "Show diagnostics"})

