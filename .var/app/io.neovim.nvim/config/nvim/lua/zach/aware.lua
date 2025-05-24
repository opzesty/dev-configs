local duration = require("zach.duration")
local M = {}

function M.end_activity(current_line)

	local now = os.date("%H:%M\t%d %b %Y\t")
	vim.fn.append(vim.fn.line("$"), now)
	local row = vim.fn.line(".")
	local updated = current_line:gsub("duration=;", "duration=" .. duration.duration_diff(current_line, now) .. ";")
	vim.fn.setline(row, updated)

end

return M
