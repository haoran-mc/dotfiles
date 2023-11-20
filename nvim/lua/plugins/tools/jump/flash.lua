return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
        search = {
            multi_window = false,
        },
        jump = {
            -- automatically jump when there is only one match
            autojump = true,
        },
        label = {
            uppercase = false,
            exclude = "s",
            rainbow = {
                enabled = true,
                shade = 5,
            },
        },
        highlight = {
            backdrop = false,
            matches = false,
        },
        modes = {
            char = {
                multi_line = false,
                keys = { "f", "F", "t", "T", ";", "," },
            },
        },
    },
    keys = {
        {
            "<c-s>", mode = { "n", "x", "o" },
            function() require("flash").jump() end,
            desc = "Flash",
        },
        {
            "<leader>v", mode = { "n", "x", "o" },
            function() require("flash").treesitter() end,
            desc = "Flash Treesitter"
        },
    },
}
