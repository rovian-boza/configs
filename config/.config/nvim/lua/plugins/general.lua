return {
  {
    "PedramNavid/dbtpal",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    ft = {
      "sql",
      "yaml",
    },
    keys = {
      { "<leader>drf", "<cmd>DbtRun<cr>" },
      { "<leader>drp", "<cmd>DbtRunAll<cr>" },
      { "<leader>dtf", "<cmd>DbtTest<cr>" },
      { "<leader>dm", "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
    },
    config = function()
      require("dbtpal").setup({
        path_to_dbt = "dbt",
        path_to_dbt_project = "",
        path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
        include_profiles_dir = true,
        include_project_dir = true,
        include_log_level = true,
        extended_path_search = true,
        protect_compiled_files = true,
        pre_cmd_args = {},
        post_cmd_args = {},
      })
      require("telescope").load_extension("dbtpal")
    end,
  },
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup(--[[optional config]])
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },
  {
    "NTBBloodbath/zig-tools.nvim",
    -- Load zig-tools.nvim only in Zig buffers
    ft = "zig",
    config = function()
      -- Initialize with default config
      require("zig-tools").setup()
    end,
    requires = {
      {
        "akinsho/toggleterm.nvim",
        config = function()
          require("toggleterm").setup()
        end,
      },
      {
        "nvim-lua/plenary.nvim",
        module_pattern = "plenary.*",
      },
    },
  },
}
