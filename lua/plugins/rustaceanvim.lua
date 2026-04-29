--rust增强插件

return {
  'mrcjkb/rustaceanvim',
  lazy = false,
  ft = { 'rust' },
  configs = function()
    tools.inlay_hints.auto = true
  end
}
