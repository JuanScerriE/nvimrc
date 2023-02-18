-- lsp options --

local M = {}

M.servers = {
    "texlab",
	"svelte",
	"lua_ls",
	"clangd",
	"zls",
	"rust_analyzer",
	"jedi_language_server",
}

M.debounce_text_changes = 150
M.virtual_text = true

return M
