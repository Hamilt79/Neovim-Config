vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--vim.keymap.set("n", "<esc>", "<C-\\><C-n>")
vim.keymap.set('t', '<Esc>', "<C-\\><C-n><C-w>h",{silent = true})
vim.keymap.set('n', '<leader>tt', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>tf', vim.cmd.NvimTreeFindFile)
vim.keymap.set('n', '<leader>dd', "\"add")

vim.keymap.set('i', '<C-k>', function()
	vim.lsp.buf.hover()
end)

vim.keymap.set('n', '<C-k>', function()
	vim.lsp.buf.hover()
end)

vim.keymap.set('n', '<leader>nh', function()
	vim.cmd.noh()
end)

vim.keymap.set('n', '<leader>ca', function() 
	vim.lsp.buf.code_action()
end)

vim.keymap.set({'i', 'n'}, '<C-s>', function()  
    vim.cmd.write()
end)

function comment()
    --vim.cmd([[visual :s/^\(\/\/\)\@!/\/\/]])
    vim.cmd([[s/^\(\/\/\)\@!/\/\/]])
    vim.cmd([[nohlsearch]])
end

function uncomment()
    vim.cmd([[s/^\/*]])
    vim.cmd([[nohlsearch]])
end

vim.keymap.set('v', '<leader>c', comment)
vim.keymap.set('v', '<leader>u', uncomment)
vim.keymap.set('n', '<leader>c', comment)
vim.keymap.set('n', '<leader>u', uncomment)
