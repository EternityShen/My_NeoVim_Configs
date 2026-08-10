return {
  "Mirsmog/real-icons.nvim",
  build = ":RealIcons install",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    integrations = {
      nvim_tree = true,
      bufferline = true,
      lualine = true,
      telescope = true,
    },
  },
}
