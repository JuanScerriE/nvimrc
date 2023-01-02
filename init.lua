local fn = vim.fn

-- init --

-- install packer if not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- plugins
require("plugins")

-- auto-complete & lsp
require("autocomplete")
require("lsp")

-- options
require("options/plugin-options")
require("options/default-options")

-- bindings
require("bindings/plugin-bindings")
require("bindings/default-bindings")

-- statusline
require("statusline").setup()
