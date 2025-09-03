-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Replicate RunCompileOnSave() from vimrc
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function(event)
    local current_dir = vim.fn.expand("%:p:h")
    if string.find(current_dir, "/Users/bob/git/dxw/dalmatian-config", 1, true) == 1 then
      vim.cmd("!echo 'Compiling...'")
      vim.cmd("!/Users/bob/git/dxw/dalmatian-config/bin/compile")
      vim.cmd("!echo 'Command executed!'")
    end
  end,
  desc = "Run Compile On Save",
})

-- Replicate RunTerraformDocsOnSave() from vimrc
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function(event)
    local current_dir = vim.fn.expand("%:p:h")
    if string.find(current_dir, "/Users/bob/git/dxw/terraform-dxw-dalmatian-infrastructure", 1, true) == 1 then
      vim.cmd("!echo 'Generating Terraform Docs...'")
      vim.cmd("!terraform-docs .")
      vim.cmd("!echo 'docs generated'")
    end
  end,
  desc = "Run Terraform Docs On Save",
})
