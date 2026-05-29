return {
  -- crates.nvim: Rust Tools 插件
  'simrat39/rust-tools.nvim',

  tag = 'stable',

  config = function()
    require('crates').setup()
  end,
}
