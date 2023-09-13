local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- Diagnostics
		-- diagnostics.flake8,
		diagnostics.pylint,
		-- Formatting ---------------------
		--  brew install shfmt
		formatting.shfmt,
		-- StyLua
        -- formatting.stylua,
        -- formatting.lua_format,
		-- python
		formatting.autopep8,
		-- frontend
		formatting.prettier.with({ -- 只比默认配置少了 markdown
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"graphql",
			},
			prefer_local = "node_modules/.bin",
		}),
		-- formatting.fixjson,
		-- formatting.black.with({ extra_args = { "--fast" } }),
	},
	-- 保存自动格式化
	on_attach = function(client)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
			    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr }),
				group = augroup,
				buffer = bufnr,
				-- on 0.8, you should use vim.lsp.buf.format instead
				callback = function()
                    vim.lsp.buf.formatting()
                end,
			})
		end
	end,
})
