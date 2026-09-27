return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          local bg = "#000000"
          local groups = {
            "Normal",
            "NormalFloat",
            "NormalNC",
            "SignColumn",
            "StatusLine",
            "StatusLineNC",
            "WinBar",
            "WinBarNC",
            "EndOfBuffer",
            "NeoTreeNormal",
            "NeoTreeNormalNC",
            "TelescopeNormal",
            "TelescopeBorder",
            "WhichKeyFloat",
          }
          for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, { bg = bg, force = true })
          end
        end,
      })
      vim.cmd("colorscheme oxocarbon")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
  },
}
