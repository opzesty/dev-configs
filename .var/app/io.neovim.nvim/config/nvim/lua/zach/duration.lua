--- Quick dirty aware plugin to calculate durations
local M = {}

function M.duration_diff(line1, line2)
  local time1 = line1:match("^(%d+:%d+)")
  local time2 = line2:match("^(%d+:%d+)")
  if not time1 or not time2 then return "00:00:00" end

  local h1, m1 = time1:match("^(%d+):(%d+)")
  local h2, m2 = time2:match("^(%d+):(%d+)")

  local start_sec = tonumber(h1) * 3600 + tonumber(m1) * 60
  local end_sec = tonumber(h2) * 3600 + tonumber(m2) * 60
  local diff = end_sec - start_sec

  if diff < 0 then return "00:00:00" end -- optional guard

  local hours = math.floor(diff / 3600)
  local minutes = math.floor((diff % 3600) / 60)
  local seconds = diff % 60

  return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

function M.apply_to_current_line()
  local row = vim.fn.line('.')
  local line1 = vim.fn.getline(row)
  local line2 = vim.fn.getline(row + 1)
  local updated = line1:gsub("duration=;", "duration=" .. M.duration_diff(line1, line2) .. ";")
  vim.fn.setline(row, updated)
end

return M
