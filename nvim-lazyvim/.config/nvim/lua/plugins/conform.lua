local function ddev_format_config(_)
  return {
    command = "dart",
    args = { "run", "dart_dev", "format" },
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

local function format_after_save_config(bufnr)
  local dry_run = false
  local needs_refresh_workaround = false
  local lsp_format = "fallback"

  if vim.api.nvim_get_option_value("filetype", { buf = bufnr }) == "dart" then
    dry_run = true
    needs_refresh_workaround = true
    lsp_format = "never"
  end

  return {
    timeout_ms = 5000,
    lsp_format = lsp_format,
    dry_run = dry_run,
  }, function()
    if needs_refresh_workaround then
      vim.cmd("silent! checktime")
    end
  end
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ddev_format_config,
      },
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        dart = { "ddev_format", stop_after_first = true },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        go = { "gofmt" },
        yaml = { "yamlfmt" },
      },
      format_after_save = format_after_save_config,
    },
  },
}
