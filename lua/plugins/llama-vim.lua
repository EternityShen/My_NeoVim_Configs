-- =============================================================================
-- llama-vim.lua - Ghost Text 行内补全（llama.cpp 官方插件）
-- =============================================================================
-- 直接对接 llama-server 的 /infill 接口，实现 Copilot 风格的 ghost text

return {
  "ggml-org/llama.vim",
  version = false,
  enabled = false,
  -- 这个插件是 VimL 写的，不需要 build
  init = function()
    -- ── 服务器地址 ────────────────────────────────────────────────────────
    vim.g.llama_config = {
      endpoint               = "http://127.0.0.1:8080/infill",

      -- ── 触发行为 ────────────────────────────────────────────────────────
      auto_fim               = true, -- 自动触发（停止输入后自动请求）
      auto_fim_delay_ms      = 500,  -- 停止输入后等待 500ms 再请求，避免过于频繁

      -- ── 补全参数 ────────────────────────────────────────────────────────
      n_predict              = 128, -- 最多预测 128 token（ghost text 不需要太长）
      temperature            = 0.1, -- 低温度，更确定性
      top_k                  = 20,
      top_p                  = 0.8,

      -- ── 上下文设置（ring buffer，给模型更多当前项目的上下文）────────────
      -- 你的 7B 模型 + 32768 ctx，可以给足够大的 ring buffer
      ring_n_chunks          = 64, -- ring buffer 保存 64 个代码块
      ring_chunk_size        = 64, -- 每块 64 行

      -- ── 超时设置 ────────────────────────────────────────────────────────
      t_max_prompt_ms        = 500,  -- prompt 处理最多等 500ms
      t_max_predict_ms       = 1000, -- 生成最多等 1000ms（7B 本地推理）

      -- ── 显示设置 ────────────────────────────────────────────────────────
      show_info              = 1, -- 显示性能信息（token 数、速度）
      -- 0 = 不显示，1 = 显示在 ghost text 旁边

      -- ── 快捷键 ──────────────────────────────────────────────────────────
      -- Tab        接受完整补全
      -- Shift+Tab  接受当前行
      -- leader+]   接受一个词
      -- leader+llf 手动触发补全
      keymap_fim_accept_full = "<A-w>",
      keymap_fim_accept_word = "<A-]>",  -- Alt+] 接受一个词
      keymap_fim_trigger     = "<A-\\>", -- Alt+\ 手动触发
      keymap_fim_cancel      = "<Esc>",  -- Esc 取消


      -- ── 不触发补全的文件类型 ─────────────────────────────────────────────
      filetype_disable = {
        "TelescopePrompt",
        "codecompanion",
        "neo-tree",
        "lazy",
        "mason",
        "help",
        "txt",
        "markdown",
      },
    }
  end,
}
