return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_default_mappings = 1

    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>", -- Select word under cursor (VSCode Ctrl+D)
      ["Find Subword Under"] = "<C-d>", -- Same as above, for visual mode
      ["Add Cursor Down"] = "<C-Down>", -- Add cursor below (VSCode Ctrl+Alt+Down)
      ["Add Cursor Up"] = "<C-Up>", -- Add cursor above (VSCode Ctrl+Alt+Up)
      ["Undo"] = "u", -- Standard Vim undo
      ["Redo"] = "<C-r>", -- Standard Vim redo
    }
  end,
}
