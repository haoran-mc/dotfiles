-- mystruct > num1
return {
    "SmiteshP/nvim-navic",
    enabled = false,
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("nvim-navic").setup({
        })
    end
}
