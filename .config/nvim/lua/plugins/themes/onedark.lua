return {
	"navarasu/onedark.nvim",
	enabled = function()
		if Variants.Theme == "onedark" then
			return true
		end
		return false
	end,
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "darker",
			transparent = true,
			ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden

			-- toggle theme style ---
			toggle_style_key = nil,                                                           -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

			-- Change code style ---
			-- Options are italic, bold, underline, none
			-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			-- Lualine options --
			lualine = {
				transparent = true, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {}, -- Ove"rride default colors
			highlights = {
				-- ["CursorLine"] = { bg = '$cursor_line_color' },
				["@comment"] = { fg = "gray" },
				Comment = { fg = "gray" },
				TreesitterContextLineNumber = { fg = "gray" },
				Normal = { bg = "NONE" },
				Visual = { bg = "#5F668A" },
				NormalFloat = { bg = "NONE" },
				FloatBorder = { bg = "NONE" },
				TelescopePromptBorder = { fg = "#a7b8d6" },
				TelescopePreviewBorder = { fg = "#a7b8d6" },
				TelescopeResultsBorder = { fg = "#a7b8d6" },
				TelescopeSelection = { bg = "#5f668a" },
				TelescopePreviewLine = { fg = "white" },
				NeoTreeGitUntracked = { fg = "#4a69bd" },
				PmenuSel = { fg = "NONE", bg = "#5f668a" },
				Pmenu = { fg = "#C5CDD9", bg = "NONE" },
				DashboardFooter = { fg = "#e2b86b" },
				NotifyBackground = { bg = "#5f668a" },
				StatusLine = { bg = "NONE" },
			}, -- Override highlight groups

			diagnostics = {
				darker = false, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = false, -- use background color for virtual text
			},
		})
		require("onedark").load()
	end,
}
