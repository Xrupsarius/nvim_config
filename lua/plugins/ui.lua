return {
  -- Тема
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, config = function() vim.cmd("colorscheme tokyonight") end },

  -- Статусная строка
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { theme = "tokyonight" } })
    end
  },

  -- Файловое дерево
  -- Дерево файлов
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local nvim_tree = require("nvim-tree")

      nvim_tree.setup({
        view = {
          width = 35,
          side = "left",
          preserve_window_proportions = true,
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = { file = true, folder = true, git = true },
          },
        },
        actions = {
          open_file = {
            quit_on_open = false, -- оставляем дерево открытым
            resize_window = true,
          },
        },
      })

      -- Автозапуск дерева при старте Neovim
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local file = vim.fn.expand("<afile>")
          if vim.fn.isdirectory(file) == 1 or file == "" then
            require("nvim-tree.api").tree.open()
          end
        end,
      })

      -- Горячие клавиши
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },

  -- Панель буферов сверху
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = { style = "icon", icon = "▎" },
          buffer_close_icon = "",
          modified_icon = "●",
          show_buffer_icons = true,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          sort_by = "id",
        },
      })

      -- Горячие клавиши для переключения буферов
      vim.keymap.set("n", "<leader>h", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>l", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true })


      -- Горячие клавиши для вкладок
      vim.keymap.set("n", "<leader>gt", ":tabnext<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "gT", ":tabprev<CR>", { noremap = true, silent = true })
      
    end,
  },
  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}

