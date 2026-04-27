-- =============================================================================
-- keymaps.lua - 基础键位映射（无插件依赖）
-- =============================================================================

-- vim.keymap.set(模式, 快捷键, 动作, 选项)
-- 模式: "n"=普通, "i"=插入, "v"=可视, "x"=可视块, "t"=终端, ""=所有模式
-- 选项: { noremap=true, silent=true, desc="描述" }
--   noremap: 防止递归映射（几乎永远应该是 true）
--   silent: 执行时不在命令行显示命令
--   desc: 描述，会被 which-key 插件显示出来

local M = {}
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
-- keymap("n", "n", "nzzzv", { noremap = true, silent = true, desc = "下一个搜索结果（居中）" })
-- keymap("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "上一个搜索结果（居中）" })

-- 快速打开/关闭诊断列表
-- keymap("n", "<leader>xl", ":lopen<CR>", { noremap = true, silent = true, desc = "打开 Location List" })
-- keymap("n", "<leader>xq", ":copen<CR>", { noremap = true, silent = true, desc = "打开 Quickfix List" })

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

-- ─────────────────────────────────────────────
-- 插件相关键位映射
-- ─────────────────────────────────────────────

-- ── Telescope：模糊搜索 ─────────────────────────────
local telescope_builtin = function(cmd)
  return function()
    require("telescope.builtin")[cmd]()
  end
end

-- 文件搜索
keymap("n", "<leader>ff", telescope_builtin("find_files"), { desc = "查找文件" })
keymap("n", "<leader>fr", telescope_builtin("oldfiles"), { desc = "最近打开的文件" })
keymap("n", "<leader>fb", telescope_builtin("buffers"), { desc = "查找已打开的 Buffer" })

-- 内容搜索
keymap("n", "<leader>fg", telescope_builtin("live_grep"), { desc = "全局内容搜索 (grep)" })
keymap("n", "<leader>fw", telescope_builtin("grep_string"), { desc = "搜索光标下的单词" })

-- Git 相关搜索
keymap("n", "<leader>gc", telescope_builtin("git_commits"), { desc = "搜索 git commits" })
keymap("n", "<leader>gb", telescope_builtin("git_branches"), { desc = "搜索 git 分支" })

-- Neovim 相关搜索
keymap("n", "<leader>fh", telescope_builtin("help_tags"), { desc = "搜索帮助文档" })
keymap("n", "<leader>fk", telescope_builtin("keymaps"), { desc = "搜索快捷键" })
keymap("n", "<leader>fc", telescope_builtin("commands"), { desc = "搜索命令" })
keymap("n", "<leader>fd", telescope_builtin("diagnostics"), { desc = "搜索 LSP 诊断信息" })

-- 搜索当前文件的函数/符号
keymap("n", "<leader>fs", telescope_builtin("lsp_document_symbols"), { desc = "搜索文件符号" })
keymap("n", "<leader>fS", telescope_builtin("lsp_workspace_symbols"), { desc = "搜索工作区符号" })

-- ── LSP：语言服务器 ─────────────────────────────
-- LSP 键映射会在 LSP 附加到缓冲区时设置
function M.lsp_on_attach(client, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func,
      { buffer = bufnr, noremap = true, silent = true, desc = "LSP: " .. desc })
  end

  -- 跳转
  map("gd", vim.lsp.buf.definition, "跳转到定义")
  map("gD", vim.lsp.buf.declaration, "跳转到声明")
  map("gi", vim.lsp.buf.implementation, "跳转到实现")
  map("gr", require("telescope.builtin").lsp_references, "查看所有引用")
  map("gt", vim.lsp.buf.type_definition, "跳转到类型定义")

  -- 查看信息
  map("K", vim.lsp.buf.hover, "悬浮文档（按两次进入）")
  map("<C-k>", vim.lsp.buf.signature_help, "函数签名帮助")
  map("<leader>li", vim.lsp.buf.incoming_calls, "查看调用者")

  -- 重构
  map("<leader>lr", vim.lsp.buf.rename, "重命名变量")
  map("<leader>la", vim.lsp.buf.code_action, "代码动作（修复建议）")

  -- 诊断信息（错误/警告）
  map("<leader>ld", vim.diagnostic.open_float, "查看当前行诊断详情")
  map("[d", vim.diagnostic.goto_prev, "跳到上一个诊断")
  map("]d", vim.diagnostic.goto_next, "跳到下一个诊断")

  -- 格式化（如果 LSP 支持）
  if client.server_capabilities.documentFormattingProvider then
    map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "格式化代码")
  end
end

-- ── Completion：自动补全 ─────────────────────────
-- 补全相关映射
function M.cmp_mappings()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  return cmp.mapping.preset.insert({
    -- 在补全菜单中上下移动
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

    -- 翻页（文档预览窗口）
    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- 文档向上滚动
    ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- 文档向下滚动

    -- 手动触发补全
    ["<C-Space>"] = cmp.mapping.complete(),

    -- 关闭补全菜单
    ["<C-e>"] = cmp.mapping.abort(),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump() -- 代码片段跳转
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- Enter 确认选中项
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace, -- 替换模式（替换光标后的文字）
      select = true,                          -- false = 只有明确选中才确认（不自动选第一个）
    }),
  })
end

-- LuaSnip 映射
keymap({ "i", "s" }, "<Tab>", function()
  local luasnip = require("luasnip")
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { silent = true, desc = "展开或跳转到下一个代码片段" })

keymap({ "i", "s" }, "<S-Tab>", function()
  local luasnip = require("luasnip")
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true, desc = "跳转到上一个代码片段" })

-- ── Git：版本控制 ─────────────────────────────
-- gitsigns 键映射
function M.gitsigns_on_attach(bufnr)
  local gs = package.loaded.gitsigns
  local map = function(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = "Git: " .. desc })
  end

  -- 在 git 修改的 hunk 之间跳转
  map("n", "]h", gs.next_hunk, "下一个 Hunk")
  map("n", "[h", gs.prev_hunk, "上一个 Hunk")

  -- 操作 hunk
  map("n", "<leader>gs", gs.stage_hunk, "暂存当前 Hunk")
  map("n", "<leader>gr", gs.reset_hunk, "撤销当前 Hunk")
  map("n", "<leader>gS", gs.stage_buffer, "暂存整个文件")
  map("n", "<leader>gR", gs.reset_buffer, "撤销整个文件")
  map("n", "<leader>gu", gs.undo_stage_hunk, "取消暂存当前 Hunk")

  -- 预览 hunk（弹出小窗口显示修改内容）
  map("n", "<leader>gp", gs.preview_hunk, "预览 Hunk")

  -- 显示 blame 信息
  map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "显示完整 Blame")

  -- 比较差异
  map("n", "<leader>gd", gs.diffthis, "与 HEAD 对比")
  map("n", "<leader>gD", function() gs.diffthis("~") end, "与上一次提交对比")
end

-- lazygit 键映射
keymap("n", "<leader>gg", ":LazyGit<CR>", { desc = "打开 LazyGit" })

-- ── Editor：编辑器增强 ─────────────────────────
-- 文件树
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "切换文件树" })
keymap("n", "<leader>E", ":NvimTreeFindFile<CR>", { noremap = true, silent = true, desc = "在文件树中定位当前文件" })

-- 终端
keymap("n", "<C-\\>", ":ToggleTerm<CR>", { noremap = true, silent = true, desc = "打开/关闭终端" })

-- Flash：快速跳转
keymap({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash 跳转" })
keymap({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter 选择" })
keymap("o", "r", function() require("flash").remote() end, { desc = "Flash 远程操作" })
keymap("c", "<c-s>", function() require("flash").toggle() end, { desc = "切换 Flash 搜索" })

-- ── Rust：Rust 开发 ─────────────────────────────
-- Rust 相关映射在 rustaceanvim 配置中设置

return M
