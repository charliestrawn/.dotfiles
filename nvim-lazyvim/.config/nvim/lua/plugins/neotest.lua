return {
  {
    "nvim-neotest/neotest",
    dependencies = { "rcasia/neotest-java" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      opts.adapters["neotest-dart"] = { command = "dart run dart_dev" }
      table.insert(opts.adapters, require("neotest-java")({}))
    end,
  },
}
