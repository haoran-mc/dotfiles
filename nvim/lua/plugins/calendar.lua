return {
    "itchyny/calendar.vim",
    keys = {
        { "<leader>ac", "<cmd>Calendar<cr>", "n", { silent = true } },
    },
	init = function()
        vim.g.calendar_frame = 'default'
	end,
}
