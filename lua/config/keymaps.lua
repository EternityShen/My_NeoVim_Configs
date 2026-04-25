-- =============================================================================
-- keymaps.lua - 基础键位映射（无插件依赖）
-- =============================================================================

-- vim.keymap.set(模式, 快捷键, 动作, 选项)
-- 模式: "n"=普通, "i"=插入, "v"=可视, "x"=可视块, "t"=终端, ""=所有模式
-- 选项: { noremap=true, silent=true, desc="描述" }
--   noremap: 防止递归映射（几乎永远应该是 true）
--   silent: 执行时不在命令行显示命令
--   desc: 描述，会被 which-key 插件显示出来

local keymap = vim.keymap.set -- 简写

-- ─────────────────────────────────────────────
-- Leader 键设置
-- ─────────────────────────────────────────────
-- Leader 键是自定义快捷键的前缀，默认是 \，改成空格更顺手
-- 必须在加载插件之前设置！（所以在 init.lua 里最早加载 keymaps）

vim.g.mapleader = " "      -- 普通模式的 leader 键设为空格
vim.g.maplocalleader = " " -- 本地 leader 键也设为空格

-- ─────────────────────────────────────────────
-- 普通模式快捷键
-- ─────────────────────────────────────────────

-- 方向键：用 Ctrl+hjkl 在窗口间跳转
keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "跳转到左窗口" })
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "跳转到下窗口" })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "跳转到上窗口" })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "跳转到右窗口" })

-- 调整窗口大小
keymap("n", "<C-w>", ":resize +2<CR>", { noremap = true, silent = true, desc = "增加窗口高度" })
keymap("n", "<C-s>", ":resize -2<CR>", { noremap = true, silent = true, desc = "减少窗口高度" })
keymap("n", "<C-a>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "减少窗口宽度" })
keymap("n", "<C-d>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "增加窗口宽度" })

-- Tab 页管理
keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true, desc = "新建 Tab" })
keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true, desc = "关闭 Tab" })
keymap("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true, desc = "下一个 Tab" })
keymap("n", "<S-Tab>", ":tabprev<CR>", { noremap = true, silent = true, desc = "上一个 Tab" })

-- 终端
keymap("n", "<leader>tt", ":terminal<CR>", { noremap = true, silent = true, desc = "新建终端" })

-- 搜索高亮：按 Esc 清除搜索高亮
keymap("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "清除搜索高亮" })

-- 移动行：在普通模式下用 Alt+j/k 上下移动整行
keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "向下移动行" })
keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "向上移动行" })

-- 快速保存
keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "保存文件" })
keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "退出" })
keymap("n", "<leader>Q", ":qa<CR>", { noremap = true, silent = true, desc = "全部保存退出" })

-- 更好的翻页体验：翻页后光标回到屏幕中央
keymap("n", "<C-u>", "<C-d>zz", { noremap = true, silent = true, desc = "向下翻半页（居中）" })
keymap("n", "<C-e>", "<C-u>zz", { noremap = true, silent = true, desc = "向上翻半页（居中）" })

-- 跳转后居中（搜索跳转时保持光标在屏幕中间）
keymap("n", "n", "nzzzv", { noremap = true, silent = true, desc = "下一个搜索结果（居中）" })
keymap("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "上一个搜索结果（居中）" })

-- 快速打开/关闭诊断列表
keymap("n", "<leader>xl", ":lopen<CR>", { noremap = true, silent = true, desc = "打开 Location List" })
keymap("n", "<leader>xq", ":copen<CR>", { noremap = true, silent = true, desc = "打开 Quickfix List" })

-- ─────────────────────────────────────────────
-- 插入模式快捷键
-- ─────────────────────────────────────────────

-- 在插入模式下按 jk 快速退出到普通模式（比按 Esc 更快）
keymap("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "退出插入模式" })
keymap("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "退出插入模式" })

-- 插入模式下的光标移动（不用退出插入模式）
keymap("i", "<C-h>", "<Left>", { noremap = true, silent = true, desc = "光标左移" })
keymap("i", "<C-l>", "<Right>", { noremap = true, silent = true, desc = "光标右移" })
keymap("i", "<C-j>", "<Down>", { noremap = true, silent = true, desc = "光标下移" })
keymap("i", "<C-k>", "<Up>", { noremap = true, silent = true, desc = "光标上移" })

-- ─────────────────────────────────────────────
-- 可视模式快捷键
-- ─────────────────────────────────────────────

-- 选中状态下移动行
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "向下移动选中行" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "向上移动选中行" })

-- 可视模式粘贴时，不覆盖寄存器中的内容
-- 普通粘贴会把选中内容放入寄存器，导致下次粘贴内容变了
keymap("v", "p", '"_dP', { noremap = true, silent = true, desc = "粘贴（不覆盖寄存器）" })

-- 可视模式下保持缩进后继续选中
keymap("v", "<", "<gv", { noremap = true, silent = true, desc = "向左缩进（保持选中）" })
keymap("v", ">", ">gv", { noremap = true, silent = true, desc = "向右缩进（保持选中）" })

-- ─────────────────────────────────────────────
-- 终端模式快捷键
-- ─────────────────────────────────────────────

-- 在终端模式下用 Esc 退出终端插入模式（回到普通模式）
keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "退出终端模式" })


-- ── 窗口分割 ──────────────────────────────────────────────
keymap("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "垂直分割窗口" })
keymap("n", "<leader>sh", "<cmd>split<cr>", { desc = "水平分割窗口" })
keymap("n", "<leader>sq", "<cmd>close<cr>", { desc = "关闭窗口" })
