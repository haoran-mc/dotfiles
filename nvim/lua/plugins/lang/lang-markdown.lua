-- depend on treesitter, and it's parsers markdown, markdown_inline
return {
    {
        "jghauser/follow-md-links.nvim",
        config = function()
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreview<cr>", "n", { silent = true } },
        },
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },
    {

        "dhruvasagar/vim-table-mode",
        ft = "markdown",
        keys = {
            { "<leader>mt", "<cmd>TableModeEnable<cr>", "n", { silent = true } },
        },
        init = function()
        end,
    }
}
