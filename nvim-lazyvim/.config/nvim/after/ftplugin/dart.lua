-- dartls advertises colorProvider but returns -32007 on documentColor requests.
-- Set the buffer variable that vim.lsp._capability.is_enabled() checks directly,
-- before LspAttach fires, so document_color is never enabled for dart buffers.
vim.b["_lsp_enabled_document_color"] = false
