vim.keymap.set("n", '<leader>pp', function() 
    local name = vim.api.nvim_buf_get_name(0)
    os.execute("python3 " .. name)
end)
