# My_NeoVim_Configs
ShenEternity的nvim配置

## 安装

### 依赖要求
- **Neovim** >= 0.9.0
- **Git**
- **Nerd Font** (推荐 JetBrainsMono Nerd Font)

### 安装命令

#### Linux / macOS
```bash
# 备份现有配置（可选）
mv ~/.config/nvim ~/.config/nvim.bak

# 克隆仓库
git clone https://github.com/ShenEternity/My_NeoVim_Configs.git ~/.config/nvim

# 启动 Neovim，插件会自动安装
nvim
```

#### Windows (PowerShell)
```powershell
# 备份现有配置（可选）
Move-Item -Path $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak -Force -ErrorAction SilentlyContinue

# 克隆仓库
git clone https://github.com/ShenEternity/My_NeoVim_Configs.git $env:LOCALAPPDATA\nvim

# 启动 Neovim，插件会自动安装
nvim
```

### 手动安装插件
首次启动后，若插件未自动安装，可手动执行：
```vim
:Lazy sync
```

### 彻底删除配置
如需完全删除此配置及所有插件：

#### Linux / macOS
```bash
# 删除配置目录
rm -rf ~/.config/nvim

# 删除插件目录（lazy.nvim 安装位置）
rm -rf ~/.local/share/nvim/lazy

# 删除 Neovim 缓存（可选）
rm -rf ~/.cache/nvim
```

#### Windows (PowerShell)
```powershell
# 删除配置目录
Remove-Item -Path $env:LOCALAPPDATA\nvim -Recurse -Force -ErrorAction SilentlyContinue

# 删除插件目录（lazy.nvim 安装位置）
Remove-Item -Path $env:LOCALAPPDATA\nvim-data\lazy -Recurse -Force -ErrorAction SilentlyContinue

# 删除 Neovim 缓存（可选）
Remove-Item -Path $env:LOCALAPPDATA\nvim-cache -Recurse -Force -ErrorAction SilentlyContinue
```

## 插件列表

### 插件管理器

| 插件 | 说明 |
|------|------|
| `lazy.nvim` | Neovim 插件管理器，支持懒加载 |

### 界面美化

| 插件 | 说明 |
|------|------|
| `catppuccin/nvim` | 颜色主题（mocha 风格） |
| `lualine.nvim` | 底部状态栏 |
| `bufferline.nvim` | 顶部标签栏 |
| `nvim-notify` | 通知美化 |
| `dashboard-nvim` | 启动欢迎界面 |
| `noice.nvim` | 命令行美化 |

### 编辑器增强

| 插件 | 说明 |
|------|------|
| `nvim-tree.lua` | 文件树浏览器 |
| `nvim-autopairs` | 括号自动配对 |
| `Comment.nvim` | 注释快捷键 |
| `vim-illuminate` | 高亮相同单词 |
| `nvim-surround` | 环绕操作 |
| `toggleterm.nvim` | 终端集成 |
| `flash.nvim` | 快速跳转 |

### 语法与高亮

| 插件 | 说明 |
|------|------|
| `nvim-treesitter` | 语法解析器 |
| `blankline.nvim` | 缩进线 |
| `rainbow` | 彩虹括号 |

### 自动补全

| 插件 | 说明 |
|------|------|
| `nvim-cmp` | 补全框架 |
| `LuaSnip` | 代码片段引擎 |
| `friendly-snippets` | 预置代码片段 |
| `cmp-nvim-lsp` | LSP 补全源 |
| `cmp-buffer` | 当前文件词汇补全 |
| `cmp-path` | 文件路径补全 |
| `cmp-cmdline` | 命令行补全 |
| `lspkind.nvim` | 补全菜单图标 |
| `neocodeium` | AI 补全 |

### LSP 与诊断

| 插件 | 说明 |
|------|------|
| `mason.nvim` | LSP 服务器安装管理器 |
| `mason-lspconfig.nvim` | Mason 与 lspconfig 桥接 |
| `nvim-lspconfig` | LSP 服务器配置 |
| `lspsaga.nvim` | LSP UI 增强 |
| `glance.nvim` | 定义/引用查看 |

### 搜索

| 插件 | 说明 |
|------|------|
| `telescope.nvim` | 模糊搜索 |
| `telescope-fzf-native.nvim` | fzf 搜索算法 |

### Git

| 插件 | 说明 |
|------|------|
| `gitsigns.nvim` | Git 状态显示 |
| `lazygit.nvim` | Neovim 内嵌 LazyGit |

### Rust 开发

| 插件 | 说明 |
|------|------|
| `rustaceanvim` | Rust LSP 集成 |
| `rust-crates` | Cargo 依赖管理 |

### 代码格式化

| 插件 | 说明 |
|------|------|
| `formatting` | 代码格式化 |
| `autopirs` | 自动格式化 |

### 调试

| 插件 | 说明 |
|------|------|
| `nvim-dap` | DAP 调试核心 |
| `nvim-dap-ui` | DAP UI 界面 |
| `nvim-dap-virtual-text` | 行内显示变量值 |
| `persistent-breakpoints.nvim` | 持久化断点 |

### 其他

| 插件 | 说明 |
|------|------|
| `which-key.nvim` | 快捷键提示 |
| `ufo.nvim` | 代码折叠 |
| `minicon` | 图标支持 |
| `inkay-hints` | 内联提示 |

## 快捷键映射

### 普通模式 (Normal Mode)

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `<C-h/j/k/l>` | 窗口跳转（左/下/上/右） |
| N | `<C-c>` | 向下翻页并居中 |
| N | `<C-u>` | 向上翻页并居中 |
| N | `<Esc>` | 清除搜索高亮 |
| N | `<A-j>` | 下移当前行 |
| N | `<A-k>` | 上移当前行 |
| N | `<leader>q` | 退出 |
| N | `<leader>Q` | 全部退出 |
| N | `<leader>w` | 保存 |
| N | `<leader>W` | 全部保存 |

### 窗口操作

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `<leader>cv` | 垂直分割窗口 |
| N | `<leader>ch` | 水平分割窗口 |
| N | `<leader>cc` | 关闭窗口 |
| N | `<leader>co` | 关闭其他窗口 |
| N | `<leader>cr` | 旋转窗口 |
| N | `<leader>cm` | 最大化窗口 |
| N | `<leader>c=` | 平衡窗口 |
| N | `<C-d>` | 高度增加 |
| N | `<C-s>` | 高度减少 |
| N | `<C-f>` | 宽度增加 |
| N | `<C-a>` | 宽度减少 |

### 插入模式 (Insert Mode)

| 模式 | Key | 作用 |
|-----|-----|------|
| I | `<C-h/j/k/l>` | 光标移动（左/下/上/右） |
| I | `jj` | 退出插入模式 |

### 可视模式 (Visual Mode)

| 模式 | Key | 作用 |
|-----|-----|------|
| V | `<A-j>` | 下移选中内容 |
| V | `<A-k>` | 上移选中内容 |
| V | `<` | 左缩进 |
| V | `>` | 右缩进 |
| V | `p` | 粘贴不覆盖剪贴板 |

### 终端模式 (Terminal Mode)

| 模式 | Key | 作用 |
|-----|-----|------|
| T | `<Esc>` | 退出终端模式 |
| N | `<leader>t` | 打开终端 |
| N | `<C-\>` | 切换终端 |

### Telescope 搜索

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `<leader>ff` | 查找文件 |
| N | `<leader>fb` | 查找buffer |
| N | `<leader>fr` | 最近文件 |
| N | `<leader>fg` | 全局搜索 |
| N | `<leader>fw` | 搜索词 |
| N | `<leader>fc` | 当前文件搜索 |
| N | `<leader>fs` | 文件符号 |
| N | `<leader>fS` | 工作区符号 |
| N | `<leader>fh` | 帮助文档 |
| N | `<leader>fk` | 快捷键 |
| N | `<leader>f:` | 命令 |
| N | `<leader>fd` | 诊断信息 |
| N | `<leader>f/` | 继续搜索 |

### LSP

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `gd` | 跳转到定义 |
| N | `gD` | 跳转到声明 |
| N | `gi` | 跳转到实现 |
| N | `gr` | 查看引用 |
| N | `K` | 悬浮文档 |
| N | `<leader>ca` | 代码动作 |
| N | `<leader>rn` | 重命名 |
| N | `<leader>lf` | 格式化 |
| N | `[d` | 上一诊断 |
| N | `]d` | 下一诊断 |

### Glance

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `gD` | 查看定义 |
| N | `gR` | 查看引用 |
| N | `gY` | 查看类型定义 |
| N | `gM` | 查看实现 |

### Git

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `<leader>gg` | 打开 LazyGit |
| N | `]h` | 下一 hunk |
| N | `[h` | 上一 hunk |

### 编辑器工具

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `<leader>e` | 切换文件树 |
| N/X/O | `s` | Flash 跳转 |

### Rust 开发

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `<leader>rr` | 运行 |
| N | `<leader>rt` | 测试 |
| N | `<leader>rd` | 调试 |
| N | `<leader>re` | 解释错误 |
| N | `<leader>rc` | 打开 Cargo.toml |
| N | `<leader>rR` | 重启RustAnalyzer |
| N | `<leader>lr` | 重命名全部 |

### 诊断查看

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `<leader>dd` | 显示当前行诊断 |
| N | `<leader>dD` | 显示工作区诊断 |

### 删除与剪切

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `dd` | 删除当前行（不覆盖剪贴板） |
| V | `d` | 删除选中内容（不覆盖剪贴板） |
| N | `xx` | 剪切当前行 |
| V | `x` | 剪切选中内容 |

### 调试 (Debug)

| 模式 | Key | 作用 |
|-----|-----|------|
| N | `<F5>` | 启动/继续调试 |
| N | `<F10>` | 单步跳过 |
| N | `<F11>` | 单步进入 |
| N | `<F12>` | 单步退出 |
| N | `<leader>b` | 切换断点 |
| N | `<leader>B` | 设置条件断点 |
| N | `<leader>dr` | 打开 REPL |
| N | `<leader>du` | 切换调试 UI |
