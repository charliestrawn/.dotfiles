-- dart_format
local function ddev_format_config(_)
	return {
		command = "dart",
		args = { "run", "dart_dev", "format" },
		cwd = function(_, _)
			return vim.fn.getcwd()
		end,
		stdin = false,
		-- After having this enabled for a bit, we actually _don't_ want the temp
		-- file to get formatted since we're now using the
		-- `format_after_save_config` to dry_run when doing dart.
		--
		-- This is desirable as deleting a file while `webdev serve` is trying to
		-- build it causes us to need to re-run the command.
		--
		-- -- `dart format` ignores hidden files & folders so we have to
		-- -- override the default here.
		-- -- tmpfile_format = "conform.$RANDOM.$FILENAME",
		condition = function(_, _)
			local pubspec_exists = require("util").file_exists(vim.fn.getcwd() .. "/pubspec.yaml")
			-- pubspec contains a dart_dev dependency
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

	-- For Dart, simply running our formatter is going to format the file.
	if vim.api.nvim_get_option_value("filetype", { buf = bufnr }) == "dart" then
		dry_run = true
		needs_refresh_workaround = true
		lsp_format = "never"
	end

	-- These options will be passed to conform.format()
	return {
		timeout_ms = 5000,
		lsp_format = lsp_format,
		dry_run = dry_run,
	}, function()
		if needs_refresh_workaround then
			-- Workaround to refresh the buffer after formatting.
			-- Specifically needed when using `dry_run = false` or
			-- `format_after_save` for formatters that set `stdin = false`.
			vim.cmd("silent! checktime")
		end
	end
end

return {
	{ -- Autoformat
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
				-- Conform can also run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				javascript = { { "prettierd", "prettier" } },
				go = { "gofmt" },
				yaml = { "yamlfmt" },
			},
			format_after_save = format_after_save_config,
		},
	},
}
