local fileinfo = {
  'filename',
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 1, -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path

  shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = '[+]', -- Text to show when the file is modified.
    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
  },
}

local location = {
  "location",
  padding = 0,
}

local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { " ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██", }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

return {
	"nvim-lualine/lualine.nvim",
	dependenies = "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
	keys = {
		{ "<A-1>", "<cmd>LualineBuffersJump! 1<cr>" },
		{ "<A-2>", "<cmd>LualineBuffersJump! 2<cr>" },
		{ "<A-3>", "<cmd>LualineBuffersJump! 3<cr>" },
		{ "<A-4>", "<cmd>LualineBuffersJump! 4<cr>" },
		{ "<A-5>", "<cmd>LualineBuffersJump! 5<cr>" },
		{ "<A-6>", "<cmd>LualineBuffersJump! 6<cr>" },
		{ "<A-7>", "<cmd>LualineBuffersJump! 7<cr>" },
		{ "<A-8>", "<cmd>LualineBuffersJump! 8<cr>" },
		{ "<A-9>", "<cmd>LualineBuffersJump! 9<cr>" },
		{ "<A-$>", "<cmd>LualineBuffersJump! $<cr>" },
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { fileinfo },
				lualine_x = {},
				lualine_y = { location },
				lualine_z = { progress },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {
				"fugitive",
				"fzf",
				"man",
				"neo-tree",
				"nvim-dap-ui",
				"quickfix",
				"toggleterm",
			},
		})
	end,
}
