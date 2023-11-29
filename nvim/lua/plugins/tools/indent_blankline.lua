return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    -- do not lazy load due to https://github.com/lukas-reineke/indent-blankline.nvim/issues/542
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local highlight = {
            "RainbowGreen",
            "RainbowBlue",
            "RainbowCyan",
            "RainbowOrange",
            "RainbowViolet",
            "RainbowYellow",
            "RainbowRed",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75" })
        end)

        require("ibl").setup({
            indent = {
                highlight = highlight,
                char = "┊",
            },
            whitespace = {
                remove_blankline_trail = false,
            },
            scope = { enabled = false },
        })
    end,
}
