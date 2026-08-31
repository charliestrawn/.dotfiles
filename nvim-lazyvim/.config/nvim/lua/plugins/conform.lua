local function ddev_format_config(_)
  return {
    command = "dart",
    args = { "run", "dart_dev", "hackFastFormat", "$FILENAME" },
    cwd = function(_, _)
      return vim.fn.getcwd()
    end,
    stdin = false,
    condition = function(_, _)
      local pubspec_exists = vim.uv.fs_stat(vim.fn.getcwd() .. "/pubspec.yaml") ~= nil
      if pubspec_exists then
        local pubspec = io.open(vim.fn.getcwd() .. "/pubspec.yaml", "r")
        if pubspec == nil then
          return false
        end

        local dart_dev_dependency_exists = false
        for line in pubspec:lines() do
          if line:find("^  dart_dev:") then
            dart_dev_dependency_exists = true
            break
          end
        end
        pubspec:close()
        return dart_dev_dependency_exists
      end

      return false
    end,
  }
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ddev_format = ddev_format_config,
      },
      notify_on_error = false,
      formatters_by_ft = {
        lua = { "stylua" },
        dart = { "ddev_format", stop_after_first = true },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        go = { "gofmt" },
        yaml = { "yamlfmt" },
      },
    },
  },
}
