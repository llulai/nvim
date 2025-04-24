local M = {}

local function switch_to_extension(ext)
  local current = vim.api.nvim_buf_get_name(0)
  local new = current:gsub("%.component%..+$", ".component." .. ext)
  if vim.fn.filereadable(new) == 1 then
    vim.cmd("edit " .. new)
  else
    print("File not found: " .. new)
  end
end

M.goto_ts = function()
  switch_to_extension("ts")
end

M.goto_html = function()
  switch_to_extension("html")
end

M.goto_css = function()
  switch_to_extension("css")
end

return M

