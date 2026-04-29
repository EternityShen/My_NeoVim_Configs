--=============================================================================
-- keymaps.lua - 基础键位映射（60键优化版）
-- =============================================================================

local M = {}
local keymap = vim.keymap.set

-- ─────────────────────────────────────────────
-- Leader 键设置
-- ─────────────────────────────────────────────
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ─────────────────────────────────────────────
-- 普通模式快捷键
-- ─────────────────────────────────────────────

-- 窗口跳转
keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "跳转左窗口" })
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "跳转下窗口" })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "跳转上窗口" })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "跳转右窗口" })

-- 插入模式快捷键
keymap("i", "<C-h>", "<Left>", { noremap = true, silent = true, desc = "左移光标" })
keymap("i", "<C-j>", "<Down>", { noremap = true, silent = true, desc = "下移光标" })
keymap("i", "<C-k>", "<Up>", { noremap = true, silent = true, desc = "上移光标" })
keymap("i", "<C-l>", "<Right>", { noremap = true, silent = true, desc = "右移光标" })

-- 快速保存/退出
keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "退出" })
keymap("n", "<leader>Q", ":qa<CR>", { noremap = true, silent = true, desc = "全部退出" })

-- 窗口操作
keymap("n", "<leader>w", "", { desc = "窗口操作" })
keymap("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "垂直分割" })
keymap("n", "<leader>wh", "<cmd>split<cr>", { desc = "水平分割" })
keymap("n", "<leader>wc", "<cmd>close<cr>", { desc = "关闭窗口" })
keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "关闭其他" })
keymap("n", "<leader>wr", "<cmd>wincmd r<cr>", { desc = "旋转窗口" })
keymap("n", "<leader>wm", "<cmd>maximize<cr>", { desc = "最大化窗口" })
keymap("n", "<leader>w=", "<cmd>wincmd =<cr>", { desc = "平衡窗口" })
keymap("n", "<C-w>", "<cmd>resize +5<cr>", { desc = "高度增加" })
keymap("n", "<C-s>", "<cmd>resize -5<cr>", { desc = "高度减少" })
keymap("n", "<C-d>", "<cmd>vertical resize +5<cr>", { desc = "宽度增加" })
keymap("n", "<C-a>", "<cmd>vertical resize -5<cr>", { desc = "宽度减少" })

-- 翻页居中
keymap("n", "<C-e>", "<C-d>zz", { noremap = true, silent = true, desc = "向下翻页" })
keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "向上翻页" })

-- 清除搜索高亮
keymap("n", "<Esc>", ":nohl<CR>", { noremap = true, silent = true, desc = "清除高亮" })

-- 移动行
keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "下移行" })
keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "上移行" })

-- ─────────────────────────────────────────────
-- 插入模式快捷键
-- ─────────────────────────────────────────────
keymap("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "退出插入" })

-- ─────────────────────────────────────────────
-- 可视模式快捷键
-- ─────────────────────────────────────────────
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "下移选中" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "上移选中" })
keymap("v", "<", "<gv", { noremap = true, silent = true, desc = "左缩进" })
keymap("v", ">", ">gv", { noremap = true, silent = true, desc = "右缩进" })
keymap("v", "p", '"_dP', { noremap = true, silent = true, desc = "粘贴不覆盖" })

-- ─────────────────────────────────────────────
-- 终端模式快捷键
-- ─────────────────────────────────────────────
keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "退出终端" })
keymap("n", "<leader>t", "<cmd>terminal<cr>")

-- ─────────────────────────────────────────────
-- Telescope 搜索
-- ─────────────────────────────────────────────
local telescope_builtin = function(cmd)
  return function() require("telescope.builtin")[cmd]() end
end

-- 文件查找
keymap("n", "<leader>f", "", { desc = "搜索" })
keymap("n", "<leader>ff", telescope_builtin("find_files"), { desc = "找文件" })
keymap("n", "<leader>fb", telescope_builtin("buffers"), { desc = "找buffer" })
keymap("n", "<leader>fr", telescope_builtin("oldfiles"), { desc = "最近文件" })

-- 内容查找
keymap("n", "<leader>fg", telescope_builtin("live_grep"), { desc = "全局搜索" })
keymap("n", "<leader>fw", telescope_builtin("grep_string"), { desc = "搜索词" })
keymap("n", "<leader>fc", telescope_builtin("current_buffer_fuzzy_find"), { desc = "当前文件搜索" })

-- 符号查找
keymap("n", "<leader>fs", telescope_builtin("lsp_document_symbols"), { desc = "文件符号" })
keymap("n", "<leader>fS", telescope_builtin("lsp_workspace_symbols"), { desc = "工作区符号" })

-- 其他搜索
keymap("n", "<leader>fh", telescope_builtin("help_tags"), { desc = "帮助文档" })
keymap("n", "<leader>fk", telescope_builtin("keymaps"), { desc = "快捷键" })
keymap("n", "<leader>f:", telescope_builtin("commands"), { desc = "命令" })
keymap("n", "<leader>fd", telescope_builtin("diagnostics"), { desc = "诊断信息" })
keymap("n", "<leader>f/", telescope_builtin("resume"), { desc = "继续搜索" })


-- ─────────────────────────────────────────────
-- LSP
-- ─────────────────────────────────────────────
function M.lsp_on_attach(client, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func,
      { buffer = bufnr, noremap = true, silent = true, desc = "LSP: " .. desc })
  end

  map("gd", vim.lsp.buf.definition, "定义")
  map("gD", vim.lsp.buf.declaration, "声明")
  map("gi", vim.lsp.buf.implementation, "实现")
  map("gr", require("telescope.builtin").lsp_references, "引用")
  map("K", vim.lsp.buf.hover, "悬浮文档")
  map("<leader>ca", vim.lsp.buf.code_action, "代码动作")
  map("<leader>rn", vim.lsp.buf.rename, "重命名")
  map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "格式化")
  map("[d", vim.diagnostic.goto_prev, "上一诊断")
  map("]d", vim.diagnostic.goto_next, "下一诊断")
end

-- ─────────────────────────────────────────────
-- 自动补全
-- ─────────────────────────────────────────────
function M.cmp_mappings()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  return cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
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
  })
end

-- ─────────────────────────────────────────────
-- Git
-- ─────────────────────────────────────────────
function M.gitsigns_on_attach(bufnr)
  local gs = package.loaded.gitsigns
  local map = function(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = "Git: " .. desc })
  end

  map("n", "]h", gs.next_hunk, "下一hunk")
  map("n", "[h", gs.prev_hunk, "上一hunk")
end

keymap("n", "<leader>gg", ":LazyGit<CR>", { desc = "LazyGit" })

-- ─────────────────────────────────────────────
-- 编辑器工具
-- ─────────────────────────────────────────────
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "文件树" })
keymap("n", "<C-\\>", ":ToggleTerm<CR>", { noremap = true, silent = true, desc = "终端" })
keymap({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash跳转" })

-- ─────────────────────────────────────────────
-- Rust 开发
-- ─────────────────────────────────────────────
keymap("n", "<leader>rr", ":RustLsp run<CR>", { desc = "运行" })
keymap("n", "<leader>rt", ":RustLsp testables<CR>", { desc = "测试" })
keymap("n", "<leader>rd", ":RustLsp debuggables<CR>", { desc = "调试" })
keymap("n", "<leader>re", ":RustLsp explainError<CR>", { desc = "解释错误" })
keymap("n", "<leader>rc", ":RustLsp openCargo<CR>", { desc = "Cargo.toml" })

--诊断查看
-- 普通模式 打开诊断
vim.keymap.set("n", "<Leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "显示当前行诊断" }, { silent = true })
-- 打开全局诊断列表（跨文件）
vim.keymap.set("n", "<Leader>D", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "显示当前工做区诊断" }, { silent = true })

return M
