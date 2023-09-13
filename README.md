# Nvim Config

`https://juejin.cn/book/7051157342770954277/section/7051399376945545252`

## Prerequisite

### Font

Download FiraCode Nerd Font from link: `https://link.juejin.cn/?target=https%3A%2F%2Fwww.nerdfonts.com%2Ffont-downloads` and install.

Change the font you are using to FiraCode in iterm2.

If this icon `` shows perfectly in your terminal then it is ok.

### Install Neovim

```bash
# MacOS
brew install neovim
# Linux
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz
tar -zxvf nvim-linux64.tar.gz
```
Change Alias
```bash
alias vi='~/nvim-linux64/bin/nvim'
alias v='~/nvim-linux64/bin/nvim'
```

### Install Requirements

```bash
pip install autopep8, isort
```

### Overall Structure

```bash
.
├── init.lua
├── lua
│   ├── basic.lua
│   ├── colorscheme.lua
│   ├── keybindings.lua
│   ├── lsp
│   │   ├── cmp.lua
│   │   ├── config
│   │   │   └── lua.lua
│   │   ├── null-ls.lua
│   │   ├── setup.lua
│   │   └── ui.lua
│   ├── plugin-config
│   │   ├── autopairs.lua
│   │   ├── bufferline.lua
│   │   ├── colorizer.lua
│   │   ├── dashboard.lua
│   │   ├── indent-blankline.lua
│   │   ├── lualine.lua
│   │   ├── neoscroll.lua
│   │   ├── nvim-tree.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── project.lua
│   │   ├── telescope.lua
│   │   └── transparent.lua
│   └── plugins.lua
├── plugin
│   └── packer_compiled.lua
└── README.md
```

首先 init.lua 是整个配置的入口文件，负责引用所有其他的模块，基本上想要打开或关闭某个插件只要在这里修改一行代码即可。

- basic.lua： 基础配置，是对默认配置的一个重置。
- colorscheme.lua： 我们安装的主题皮肤配置，在这里切换主题。
- keybindings.lua： 快捷键的设置，所有插件的快捷键也都会放在这里。
- plugins.lua： 插件安装管理，插件安装或卸载全在这里设置。
- lsp 文件夹： 是对 Neovim 内置 LSP 功能的配置，包括常见编程语言与语法提示等。
- config ： 文件夹包含各种语言服务器单独的配置文件。
- setup.lua ： 内置 LSP 的配置。
- cmp.lua ： 语法自动补全补全的配置，包括各种补全源，与自定义代码段。
- ui.lua： 对内置 LSP 功能增强和 UI 美化。
- formatter.lua： 独立代码格式化功能。
- plugin-config 文件夹： 是对第三方插件的配置，未来每添加一个插件，这里就多一个配置文件。
- utils 文件夹： 是对常见问题的修改，包括输入法切换，针对 windows 的特殊配置等。


### 安装Packer.nvim插件管理器

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 安装Copilot.vim

```bash
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```
