-- =============================
--  Beautiful Diagnostics Setup
-- =============================

-- 1) Настройка внешнего вида диагностики
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 4,
  },
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- 2) Символы для знаков слева (Error/Warning/Hint/Info)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- 3) Показывать окно диагностики ПО НАВЕДЕНИЮ КУРСОРА
vim.o.updatetime = 250 -- задержка до показа (меньше = быстрее)

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      border = "rounded",
    })
  end,
})

-- 4) Горячая клавиша: Alt+o — открыть окно диагностики вручную
vim.keymap.set("n", "<M-o>", function()
  vim.diagnostic.open_float(nil, { border = "rounded" })
end, { desc = "Show diagnostics float" })

-- 5) Перемещение между ошибками
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

return {}

