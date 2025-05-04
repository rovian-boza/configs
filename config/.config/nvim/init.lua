-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
      },
      n = {
        ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
      },
    },
  },
})
