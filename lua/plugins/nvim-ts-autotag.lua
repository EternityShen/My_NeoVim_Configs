return {
  "windwp/nvim-ts-autotag",
  config = function()
    require('nvim-ts-autotag').setup({
      opts = {
        enable_close = true,                  -- 自动闭合标签 <div> -> <div></div>
        enable_rename = true,                 -- 自动同步修改标签名
        enable_close_on_slash = true,         -- 输入 / 时自动闭合
      }
    })
  end
}
