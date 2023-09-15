vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用opt参数
local opt = { noremap = true, silent = true }

map("n", "Q", ":q<CR>", opt)
map("n", "S", ":w<CR>", opt)
map("i", "jk", "<ESC>", opt)

map("n", "i", "k", opt)
map("n", "j", "h", opt)
map("n", "k", "j", opt)
map("n", "l", "l", opt)
map("n", "h", "i", opt)
map("n", "H", "I", opt)
map("v", "i", "k", opt)
map("v", "j", "h", opt)
map("v", "k", "j", opt)
map("v", "l", "l", opt)
map("v", "h", "i", opt)
map("v", "H", "I", opt)
map("n", "<LEADER><CR>", ":nohlsearch<CR>", opt)
map("n", "f", "/", opt)

-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- 窗口之间跳转
-- map("n", "<C-w>k", "<C-w>j", opt)
-- map("n", "<C-w>i", "<C-w>k", opt)
-- map("n", "<C-w>j", "<C-w>h", opt)
-- map("n", "<C-w>l", "<C-w>l", opt)

-- Terminal相关
map("n", "<leader>t", ":let $VIM_DIR=expand('%:p:h')<CR>:sp<CR>:terminal<CR>:startinsert<CR>cd $VIM_DIR<CR><C-l>", opt)
map(
	"n",
	"<leader>vt",
	":let $VIM_DIR=expand('%:p:h')<CR>:vsp<CR>:terminal<CR>:startinsert<CR>cd $VIM_DIR<CR><C-l>",
	opt
)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "jk", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "K", ":move '>+1<CR>gv-gv", opt)
map("v", "I", ":move '<-2<CR>gv-gv", opt)

-- 上下滚动浏览
map("n", "<C-i>", "kkkk", opt)
map("n", "<C-k>", "jjjj", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "5k", opt)
map("n", "<C-d>", "5j", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}

-- 左右Tab切换
map("n", "<C-j>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<leader>q", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bj", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-k>"] = "move_selection_next",
		["<C-i>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<C-n>"] = "cycle_history_next",
		["<C-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-c>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(map)
	-- rename
	map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- code action
	-- map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- go xx
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	-- diagnostic
	map("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	map("n", "<leader>f", ":Format", opt)
	-- 没用到
	-- map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- SymbolsOutline
map("n", "<leader>b", ":AerialToggle<CR>", opt)

return pluginKeys
