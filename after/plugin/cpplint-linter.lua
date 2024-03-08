vim.keymap.set('n', '<leader>cp', function()

	local curFile = vim.api.nvim_buf_get_name(0) 
	local handle = io.popen("cpplint " .. curFile .. " 2>&1")
	local result = handle:read("*a")
    vim.notify(result, vim.log.levels.INFO)
    --print(result)
	handle:close()

end)

