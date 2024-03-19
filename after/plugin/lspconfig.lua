require("mason").setup()
require("mason-lspconfig").setup( {
	ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "html", "cssls", "denols", "omnisharp" },
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


local capabilties = require('cmp_nvim_lsp').default_capabilities()
--require("lspconfig").golangci_lint.setup {}
require("lspconfig").lua_ls.setup { capabilities = capabilties }
require("lspconfig").rust_analyzer.setup {}

require("lspconfig").gopls.setup { capabilities = capabilties }

--require("lspconfig").clangd.setup {}
require("lspconfig").clangd.setup { capabilities = capabilties }


require("lspconfig").html.setup { capabilities = capabilties }
require("lspconfig").cssls.setup { capabilities = capabilties }
require("lspconfig").denols.setup { capabilities = capabilties }
require("lspconfig").omnisharp.setup { capabilities = capabilties }

--require("lspconfig").ast_grep.setup { capabilities = capabilties }

