-- depend on treesitter, and it's parsers markdown, markdown_inline
return {
    {
        "jghauser/follow-md-links.nvim",
        ft = "markdown",
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreview<cr>", "n", { silent = true } },
        },
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },
    {

        "dhruvasagar/vim-table-mode",
        keys = {
            { "<leader>mt", "<cmd>TableModeEnable<cr>", "n", { silent = true } },
        },
        init = function()
        end,
    }
}
