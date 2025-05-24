vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pp", function()
    local word = vim.fn.expand("<cword>")
    vim.cmd("vimgrep /" .. word .. "/ **")
    vim.cmd("copen")
end, { desc = "Vimgrep for word under cursor" })

-- Stuff to make aware duration easier...pretty kludgy
local duration = require("zach.duration")
local aware = require("zach.aware")

vim.keymap.set("n", "<leader>er", function()
  local line = vim.fn.getline(".")
  aware.end_activity(line)
end, { desc = "End the current activity (and start the next one)" })

vim.keymap.set("n", "<leader>ee", duration.apply_to_current_line, { desc = "Fill in duration from next line" })

vim.keymap.set("n", "<leader>eg", function()
  local duration = require("zach.duration")
  local lines = vim.fn.getline(1, "$")

  for i = 1, #lines - 1 do
    if lines[i]:find("duration=;") then
      local new_line = lines[i]:gsub("duration=;", "duration=" .. duration.duration_diff(lines[i], lines[i + 1]) .. ";")
      vim.fn.setline(i, new_line)
    end
  end
end, { desc = "Apply duration to all matching lines" })


