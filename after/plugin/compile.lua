vim.keymap.set("n", '<leader>cc', function() 
    --print(vim.lsp.get_active_clients()) 
    local curLsp = vim.lsp.get_active_clients()

    local cpp = "clangd"
    for field, val in pairs(curLsp) do
        if val and val.name then
            print(val.name)
            if val.name == "clangd" then
               os.execute("g++ -Wall -g -std=c++17 *.cpp -o main")
            end
        end
    end

end)
