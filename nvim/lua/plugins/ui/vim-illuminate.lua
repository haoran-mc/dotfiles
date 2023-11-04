return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
            filetypes_denylist = {
                "lazy",
                "neo-tree",
                "nep-tree-pop",
                "toggleterm",
                "TelescopePrompt",
                "markdown",
                "txt"
            },
            -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
            -- Only applies to the 'regex' provider
            -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
            providers_regex_syntax_allowlist = {
                "^[_a-zA-Z][_a-zA-Z0-9]*$", -- legal variable name
            },
            -- min_count_to_highlight: minimum number of matches required to perform highlighting
            min_count_to_highlight = 2,
        })
        vim.cmd[[hi! link illuminatedWordText Visual]]
        vim.cmd[[hi! link illuminatedWordRead Visual]]
        vim.cmd[[hi! link illuminatedWordWrite Visual]]
        vim.cmd[[hi illuminatedWord cterm=underline gui=underline]]
    end
}
