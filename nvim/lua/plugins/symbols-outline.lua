return {
    "simrat39/symbols-outline.nvim",
    keys = {
        { "<leader>cs", "<cmd>SymbolsOutline<cr>", "n", { silent = true } },
    },
    config = function()
        require("symbols-outline").setup()
    end
}
