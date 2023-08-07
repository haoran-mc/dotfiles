-- Active indent guide and indent text objects. When you're browsing
-- code, this highlights the current level of indentation, and animates
-- the highlighting.
return {
	"echasnovski/mini.indentscope",
	version = false, -- wait till new 0.7.0 release to put it back on semver
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mini.indentscope").setup({
			-- Draw options
			draw = {
				-- Delay (in ms) between event and start of drawing scope indicator
				delay = 0,
			},
			-- Which character to use for drawing scope indicator
			symbol = "¦",
			options = { try_as_border = true },
		})
	end,
}
