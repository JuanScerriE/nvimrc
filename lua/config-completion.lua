local api = vim.api

-- autocomplete --

local has_words_before = function()
	local line, col = unpack(api.nvim_win_get_cursor(0))
	return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")

local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- navigate docs
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		-- invoke completion
		["<C-space>"] = cmp.mapping.complete(),

		["<C-y>"] = cmp.config.disable,

		-- close completion
		["<C-e>"] = cmp.mapping.abort(),

		-- complete selection
		["<CR>"] = cmp.mapping.confirm({
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "luasinp" },
	}),
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}),
})