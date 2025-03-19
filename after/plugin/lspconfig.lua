require("mason").setup()
require("mason-lspconfig").setup( {
	--ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "html", "cssls", "omnisharp", "marksman", "tsserver", "intelephense", "pylsp" },
} )

local cmp = require("cmp")
cmp.setup({

	snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
       -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		--['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		--['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<C-Space>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),

	sources = cmp.config.sources( {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'cmdline' },
	} ),
})

vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

local capabilties = require('cmp_nvim_lsp').default_capabilities()
--require("lspconfig").golangci_lint.setup {}
--require("lspconfig").tsserver.setup { capabilities = capabilties }
--require("lspconfig").lua_ls.setup { capabilities = capabilties }
--require("lspconfig").pylsp.setup { capabilities = capabilties }
require("lspconfig").rust_analyzer.setup {}
--
--require("lspconfig").gopls.setup { capabilities = capabilties }
--
----require("lspconfig").clangd.setup {}
require("lspconfig").clangd.setup { capabilities = capabilties }
require("lspconfig").pylsp.setup { capabilities = capabilties }
--
--
--require("lspconfig").html.setup { capabilities = capabilties }
--require("lspconfig").cssls.setup { capabilities = capabilties }
--require("lspconfig").omnisharp.setup { capabilities = capabilties }
--require("lspconfig").marksman.setup { capabilities = capabilties }
--require("lspconfig").intelephense.setup { capabilities = capabilties, root_dir = require("lspconfig").util.root_pattern("composer.json", ".git", "*.php"), }

--require("lspconfig").ast_grep.setup { capabilities = capabilties }

