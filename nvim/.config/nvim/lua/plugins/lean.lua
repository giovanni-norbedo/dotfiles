return {
  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      mappings = true,
    },
    keys = {
      { "<leader>iv", ":LeanInfoviewToggle<CR>", desc = "Toggle Lean Infoview" },
    },
  },
}
