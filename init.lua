-- 基础设置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer 插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.colorizer")
require("plugin-config.neoscroll")
-- require("plugin-config.transparent")
-- require("copilot")
-- require("copilot-cmp")
-- 内置LSP
require("lsp.setup")
require("lsp.ui")
require("lsp.null-ls")
require("lsp.cmp")

vim.cmd([[imap <silent><script><expr> <C-y> copilot#Accept("\<CR>")]])
vim.g.copilot_no_tab_map = true
vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
vim.cmd([[set updatetime=100]])

vim.cmd([[set mouse=]])
vim.notify = require("notify")
