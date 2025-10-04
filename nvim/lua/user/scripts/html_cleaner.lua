local M = {}

-- Function to clean HTML content in the current buffer
function M.clean_html_buffer()
  -- Replace closing tags with newlines
  vim.cmd([[%s#</[^>]\+>#\r#g]])

  -- Remove all remaining tags
  vim.cmd([[%s#<[^>]\+>##g]])

  -- Remove empty lines
  vim.cmd([[%g/^\s*$/d]])

  -- Optional: sort unique
  vim.cmd([[%sort u]])
end

return M

