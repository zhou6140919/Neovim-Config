local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` users.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` users.
			-- vim.fn["UltiSnips#Anon"](args.body)

			-- For `snippy` users.
			-- require'snippy'.expand_snippet(args.body)
		end,
	},

	-- 补全源
	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		-- For vsnip users.
		-- { name = "vsnip" },

		-- For luasnip users.
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		--For ultisnips users.
		-- { name = 'ultisnips' },

		-- -- For snippy users.
		-- { name = 'snippy' },
	}),

	mapping = {
		["<Tab>"] = vim.schedule_wrap(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end),
		["<S-Tab>"] = vim.schedule_wrap(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
	},

	-- mapping = {

	-- 	["<Tab>"] = cmp.mapping(function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.select_next_item()
	-- 		elseif luasnip.expand_or_jumpable() then
	-- 			luasnip.expand_or_jump()
	-- 		elseif has_words_before() then
	-- 			cmp.complete()
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end, { "i", "s" }),

	-- 	["<S-Tab>"] = cmp.mapping(function(fallback)
	-- 		if cmp.visible() then
	-- 			cmp.select_prev_item()
	-- 		elseif luasnip.jumpable(-1) then
	-- 			luasnip.jump(-1)
	-- 		else
	-- 			fallback()
	-- 		end
	-- 	end, { "i", "s" }),
	-- 	-- ... Your other mappings ...
	-- 	["<CR>"] = cmp.mapping.confirm({
	-- 		select = true,
	-- 		behavior = cmp.ConfirmBehavior.Replace,
	-- 	}),

	-- 	-- ... Your other mappings ...
	-- },

	formatting = require("lsp.ui").formatting,
	-- formatter = {
	-- 	insert_text = require("copilot_cmp.format").remove_existing,
	-- },

	sorting = {
		priority_weight = 2,
		comparators = {
			-- require("copilot_cmp.comparators").prioritize,
			-- require("copilot_cmp.comparators").score,

			-- Below is the default comparitor list and order for nvim-cmp
			cmp.config.compare.offset,
			-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},

	-- ... Your other configuration ...
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
