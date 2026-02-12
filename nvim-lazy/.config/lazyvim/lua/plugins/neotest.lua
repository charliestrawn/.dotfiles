return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "rcasia/neotest-java",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-java")({
          -- Automatically detect Gradle wrapper
          ignore_wrapper = false,
        })
      )
      return opts
    end,
    keys = {
      -- Override/add to default LazyVim keymaps
      {
        "<leader>ta",
        function()
          require("neotest").run.run(vim.fn.expand("%:p:h"))
        end,
        desc = "Run All Test Files in Directory",
      },
      {
        "<leader>tA",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run All Tests in Project",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Toggle Watch Current File",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug Nearest Test",
      },
    },
  },
}
