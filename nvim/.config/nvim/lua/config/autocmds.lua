-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "*.pdf", "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  callback = function(opts)
    local ext = opts.file:match("^.+%.(.+)$"):lower()

    if ext == "pdf" then
      vim.fn.jobstart({ "zathura", opts.file }, { detach = true })
    else
      vim.fn.jobstart({ "imv", opts.file }, { detach = true })
    end

    vim.api.nvim_buf_delete(opts.buf, { force = true })
  end,
  desc = "Open PDF and Images in external apps",
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "silent! write",
  desc = "Autosave",
})
