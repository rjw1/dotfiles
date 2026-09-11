-- Only active under ~/bin/markdown-view, which starts nvim with g:markdown_view
-- set. Keeps the rendered view under the cursor instead of showing raw markdown.
if not vim.g.markdown_view then
  return {}
end

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      render_modes = true,
      anti_conceal = { enabled = false },
    },
  },
}
