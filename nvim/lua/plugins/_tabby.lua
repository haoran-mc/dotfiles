return {
    "nanozuki/tabby.nvim",
    keys = {
        { "<leader>tn", "<cmd>$tabnew<cr>", "n", { noremap = true, silent = true } },
        { "<leader>tc", "<cmd>tabclose<cr>", "n", { noremap = true, silent = true } },
        { "<leader>to", "<cmd>tabonly<cr>", "n", { noremap = true, silent = true } },
        { "<leader>tmp", "<cmd>-tabmove<cr>", "n", { noremap = true, silent = true } },
        { "<leader>tmn", "<cmd>+tabmove<cr>", "n", { noremap = true, silent = true } },
    },
    config = function()
        require("tabby").setup({
        })
    end
}
