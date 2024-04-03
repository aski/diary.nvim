local log = require('plenary.log'):new()
log.level = 'debug'

local M = {}

function M.diary()
  local file_path = vim.fs.normalize('~/diary/' .. os.date '%Y-%m-%d' .. '.md')
  vim.cmd('edit ' .. file_path)

  local buffer = 0
  vim.api.nvim_win_set_cursor(buffer, { vim.api.nvim_buf_line_count(buffer), 0 })

  local last_line = vim.api.nvim_get_current_line()
  if last_line ~= nil and last_line ~= '' then
    vim.api.nvim_buf_set_lines(buffer, -1, -1, true, { '', '' })
  end

  local new_heading = { '# ' .. os.date '%a %d %b %Y, %T', '' }
  local insert_pos = vim.api.nvim_buf_line_count(buffer) - 1
  vim.api.nvim_buf_set_lines(buffer, insert_pos, insert_pos, true, new_heading)
  vim.api.nvim_win_set_cursor(buffer, { vim.api.nvim_buf_line_count(buffer), 0 })
end

return M
