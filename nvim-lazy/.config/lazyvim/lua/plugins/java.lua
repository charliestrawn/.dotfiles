return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function()
      local jdtls = require("jdtls.setup")

      return {
        root_dir = jdtls.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
        cmd = { vim.fn.exepath("jdtls") },
        full_cmd = function(opts)
          return opts.cmd
        end,
      }
    end,
  },
}
