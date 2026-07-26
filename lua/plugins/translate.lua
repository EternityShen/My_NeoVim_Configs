return {
  "voldikss/vim-translator",
  config = function()
    -- 设置目标语言为中文
    vim.g.translator_target_lang = "zh"
    -- 默认使用的翻译引擎（依次尝试 google, bing, youdao）
    vim.g.translator_default_engines = { "google", "bing" }

    local opts = { silent = true }
    -- Normal 模式：翻译当前光标下的词/行
    vim.keymap.set("n", "<leader>t", "<Plug>TranslateW", { noremap = true, silent = true, desc = "翻译 词/行" })
    -- Visual 模式：选中多行翻译
    vim.keymap.set("v", "<leader>t", "<Plug>TranslateWV", { noremap = true, silent = true, desc = "翻译 当前选中" })
  end,
}
