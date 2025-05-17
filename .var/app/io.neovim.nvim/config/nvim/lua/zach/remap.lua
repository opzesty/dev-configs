vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pp", function()
    local word = vim.fn.expand("<cword>")
    vim.cmd("vimgrep /" .. word .. "/ **")
    vim.cmd("copen")
end, { desc = "Vimgrep for word under cursor" })
