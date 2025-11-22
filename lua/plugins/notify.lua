return {
{
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      render = "minimal",
      stages = "fade_in_slide_out",
      timeout = 4000,
    })
    vim.notify = require("notify")
  end,
},
}
