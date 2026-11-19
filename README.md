# My NeoVim Configs

个人 Neovim 配置，基于 [lazy.nvim](https://github.com/folke/lazy.nvim) 管理插件。

## 环境

- OS: Arch Linux
- 会话: Wayland
- Neovim: v0.12.6
- 包管理器: lazy.nvim

## 目录结构

```
~/.config/nvim/
├── init.lua              # 入口文件
├── lazy-lock.json        # 锁定插件版本
├── README.md
└── lua/
    ├── config/
    │   ├── options.lua   # 编辑器基础选项（行号、缩进、剪贴板等）
    │   ├── keymaps.lua   # 快捷键映射
    │   └── lazy.lua      # lazy.nvim 初始化
    └── plugins/          # 各插件配置
        ├── avante.lua        # AI Agent（当前禁用）
        ├── completion.lua    # nvim-cmp 自动补全
        ├── lsp.lua           # LSP 配置
        ├── lspsaga.lua       # LSP 增强 UI
        ├── rustaceanvim.lua  # Rust 开发
        ├── telescope.lua     # 模糊查找
        ├── treesitter.lua    # 语法高亮
        ├── catppuccin.lua    # 主题
        └── ...               # 其他插件
```

## 剪贴板（Wayland）

本配置已设置 `opt.clipboard = "unnamedplus"`。

在 Wayland 下使用系统剪贴板需要安装 `wl-clipboard`：

```bash
sudo pacman -S wl-clipboard
```

安装后重启 nvim 即可正常复制/粘贴。

## 常用命令

- `:Lazy` — 打开插件管理界面
- `:Lazy sync` — 安装/更新所有插件
- `:Lazy health` — 检查插件健康状态

## 快捷键

Leader 键为空格 (`<leader> = " "`)。

### 窗口操作

| 键位 | 功能 |
|------|------|
| `<C-Left/Down/Up/Right>` | 跳转窗口 |
| `<leader>cv` / `<leader>ch` | 垂直/水平分割 |
| `<leader>cc` | 关闭当前窗口 |
| `<leader>co` | 关闭其他窗口 |
| `<leader>cm` | 最大化窗口 |

### 搜索（Telescope）

| 键位 | 功能 |
|------|------|
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 全局搜索 |
| `<leader>fb` | 查找 buffer |
| `<leader>fr` | 最近文件 |

### LSP

| 键位 | 功能 |
|------|------|
| `K` | 悬浮文档 |
| `<leader>ca` | 代码动作 |
| `<leader>rn` | 重命名 |
| `gd` | 查看定义 (Glance) |
| `gr` | 查看引用 (Glance) |

### 其他

| 键位 | 功能 |
|------|------|
| `<leader>e` | 打开/关闭文件树 |
| `<C-\>` | 打开/关闭终端 |
| `<leader>q` | 退出 |
| `<leader>w` | 保存 |

## 安装

克隆到 `~/.config/nvim`，然后启动 nvim，插件会自动安装：

```bash
git clone git@github.com:EternityShen/My_NeoVim_Configs.git ~/.config/nvim
nvim
```

首次启动会自动安装 lazy.nvim 及所有插件。
