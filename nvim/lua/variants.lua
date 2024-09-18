Variants = {}

-- 1. set filetype for indent, complete
Variants.CodeFileTypeList = {
	"go",
	"lua",
	"python", -- → python-lsp-server
	"c",
	"cpp",
}
-- 2. set ensure installed language server (plugins.lang.lsp.mason)
-- 3. set ensure installed language parser (plugins.tools.treesitter)
-- 4. language server setup (plugins.lang.lsp.nvim-lspconfig)

-- [[ python-lsp-server
-- 1. pip install "python-lsp-server[all]"
-- 2. pip install python-lsp-isort
-- 3. pip install pylsp-mypy
-- 4. pip install python-lsp-black
-- ]]

Variants.Theme = "onedark"
