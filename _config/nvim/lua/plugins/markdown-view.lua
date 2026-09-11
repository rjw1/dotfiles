-- Read-only markdown viewer mode for LazyVim.
--
-- This file does nothing during normal editing. It only activates when nvim is
-- started with the global variable g:markdown_view set, which is what the
-- wrapper script ~/bin/markdown-view does:
--
--   nvim -R --cmd 'let g:markdown_view = 1' FILE
--
-- Any equivalent invocation works, e.g. an alias, or
-- `nvim -R --cmd 'let g:markdown_view = 1' README.md` typed by hand.
--
-- When active it turns the editor into something closer to a pager:
--
--   * render-markdown.nvim keeps the cursor line rendered instead of dropping
--     back to raw markdown (anti_conceal off), and renders in every mode.
--   * Line numbers, the sign column and LSP diagnostics are switched off.
--   * A one-cell blank gutter is kept on the left via a single-space
--     statuscolumn.
--   * On terminals wider than `width` columns the text is centred: empty
--     scratch windows are opened either side of the main window and resized on
--     VimResized so the text column stays `width` wide. Focus is bounced out of
--     the padding windows, and :q on the main window closes them first so nvim
--     exits as normal.
--
-- Change `width` below to alter the centred column width.
if not vim.g.markdown_view then
  return {}
end

local width = 90
local group = vim.api.nvim_create_augroup("markdown_view", { clear = true })
local main
local sides = {}

local function pad_win(side)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  local win = vim.api.nvim_open_win(buf, false, { split = side, win = main, width = 1, noautocmd = true })
  vim.wo[win].statuscolumn = ""
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].signcolumn = "no"
  vim.wo[win].cursorline = false
  vim.wo[win].winfixwidth = true
  vim.wo[win].fillchars = "eob: ,vert: "
  vim.wo[win].winhighlight = "WinSeparator:Normal"
  return win
end

local function close_sides()
  for _, win in ipairs(sides) do
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end
  sides = {}
end

local function layout()
  -- Each side window costs its width plus one separator column.
  local pad = math.floor((vim.o.columns - width) / 2) - 1
  if pad < 1 then
    close_sides()
    return
  end
  if vim.tbl_isempty(sides) then
    sides = { pad_win("left"), pad_win("right") }
  end
  for _, win in ipairs(sides) do
    vim.api.nvim_win_set_width(win, pad)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  once = true,
  callback = function()
    main = vim.api.nvim_get_current_win()
    vim.diagnostic.enable(false)
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.signcolumn = "no"
    vim.opt.statuscolumn = " "
    vim.opt.fillchars:append({ vert = " " })
    vim.wo[main].winhighlight = "WinSeparator:Normal"
    layout()

    vim.api.nvim_create_autocmd("VimResized", { group = group, callback = layout })

    -- Keep focus out of the padding windows.
    vim.api.nvim_create_autocmd("WinEnter", {
      group = group,
      callback = function()
        if vim.tbl_contains(sides, vim.api.nvim_get_current_win()) then
          vim.api.nvim_set_current_win(main)
        end
      end,
    })

    -- Closing the main window would otherwise leave the padding behind.
    vim.api.nvim_create_autocmd("QuitPre", {
      group = group,
      callback = function()
        if vim.api.nvim_get_current_win() == main then
          close_sides()
        end
      end,
    })
  end,
})

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      render_modes = true,
      anti_conceal = { enabled = false },
    },
  },
}
