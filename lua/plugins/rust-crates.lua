return {
  -- crates.nvim: Rust Crates 插件
  'saecki/crates.nvim',

  tag = 'stable',

  config = function()
    require('crates').setup()
  end,
}
