local home = os.getenv("HOMEj")

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          format = {
            enabled = true,
            settings = {
              -- Optional: point to your google-java-format or checkstyle XML
              url = home .. "rrpl-eclipse-style.xml",
            },
          },
        },
      },
    },
    --   opts = function()
    --     local jdtls = require("jdtls.setup")
    --
    --     return {
    --       root_dir = jdtls.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
    --       cmd = { vim.fn.exepath("jdtls") },
    --       full_cmd = function(opts)
    --         return opts.cmd
    --       end,
    --     }
    --   end,
  },
}
