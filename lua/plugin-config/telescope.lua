local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

local previewers = require("telescope.previewers")

local new_maker = function(filepath, bufnr, opts)
	opts = opts or {}

	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then
			return
		end
		if stat.size > 100000 then
			return
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

telescope.setup({
	defaults = {
		-- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
		initial_mode = "insert",
		-- 窗口内快捷键
		mappings = require("keybindings").telescopeList,

		buffer_previewer_maker = new_maker,
	},
	pickers = {
		-- 内置 pickers 配置
		find_files = {
			-- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
			-- theme = "dropdown",
		},
	},
	extensions = {
		-- 扩展插件配置
	},
})

-- telescope extensions
pcall(telescope.load_extension, "env")
