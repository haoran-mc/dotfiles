local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestion
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motion
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with window
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = '<c-d>', -- binding to scroll down inside the popup
		scroll_up = '<c-u>', -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the column
		width = { min = 20, max = 50 }, -- min and max width of the column
		spacing = 3, -- spacing between column
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup trigger
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change thi
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local nopts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mapping
	silent = true, -- use `silent` when creating keymap
	noremap = true, -- use `noremap` when creating keymap
	nowait = true, -- use `nowait` when creating keymap
}

local nmappings = {
	["<tab>"] = { "<cmd>bp<cr>", "just now buffer" },
	["a"] = {
		name = "+application",
		g = { "<cmd>Goyo<cr>", "Goyo" },
		u = { "<cmd>UndotreeToggle<cr>", "UndoTree" },
		t = { "<cmd>FloatermNew<cr>", "FloatermNew" },
	},
	["b"] = {
		name = "+buffer",
		a = { "<cmd>call DeleteHiddenBuffers()<cr>", "delete hidden buffers" },
		d = { "<cmd>bdelete<cr>", "buffer delete" },
		h = { "<cmd>Startify<cr>", "buffer home" },
		l = { "<cmd>ls<cr>", "buffer list" },
		n = { "<cmd>bnext<cr>", "buffer next" },
		p = { "<cmd>bprevious<cr>", "buffer previous" },
		s = { "<cmd>Scratch<cr>", "scratch buffer"},
		N = { "<cmd>enew<cr>", "buffer new" },
	},
	["c"] = {
		name = "+compile/comment",
	},
	["d"] = {
		name = "+directory",
		c = { "<cmd>cd %:h<cr>", "current file directory" },
		["-"] = { "<cmd>cd -<cr>", "previous directory" },
	},
	["e"] = {
		name = "+errors/easymotion",
	},
	["f"] = {
		name = "+find/files/fold",
		-- r = { "<cmd>bro ol<cr>", "recent files" },
		A = { "<cmd>Ag<cr>", "Ag" },
		b = { "<cmd>Buffers<cr>", "open buffers" },
		B = {
			name = "+current buffer",
			l = { "<cmd>BLines<cr>", "lines" },
			t = { "<cmd>BTags<cr>", "tags" },
			c = { "<cmd>BCommits<cr>", "commits" },
		},
		C = {
			name = "+color/commit/command",
			l = { "<cmd>Colors<cr>", "colors" },
			i = { "<cmd>Commits<cr>", "commits" },
			a = { "<cmd>Commands<cr>", "commands" },
		},
		f = { "<cmd>Files<cr>", "find file" },
		F = { "<cmd>FZF ~<cr>", "find file ~"},
		G = {
			name = "+git",
			f = { "<cmd>GFiles<cr>", "Git files" },
			s = { "<cmd>GFiles?<cr>", "Git status" },
		},
		h = { "<cmd>History<cr>", "history" },
		H = {
			name = "+history",
			[":"] = { "<cmd>History:", "history commands" },
			["/"] = { "<cmd>History/", "hsitory search" },
		},
		l = { "<cmd>Lines<cr>", "lines" },
		m = { "<cmd>Marks<cr>", "marks" },
		M = { "<cmd>Maps<cr>", "maps" },
		r = { "<cmd>FZFMru<cr>", "recent files" },
		R = { "<cmd>Rg<cr>", "Rg" },
		-- R = { "<cmd>NERDTree ~/.config/nvim<cr>", "Reload vimrc" },
		s = { "<cmd>w<cr>", "save file" },
		S = { "<cmd>Snippets<cr>", "snippets" },
		t = { "<cmd>NERDTreeToggle<cr>", "file tree" },
		T = {
			name = "+tags",
			t = { "<cmd>Tags<cr>", "tags" },
			h = { "<cmd>Helptags<cr>", "help tags" },
			f = { "<cmd>Filetypes<cr>", "file types" },
		}
	},
	["g"] = {
		name = "+git/version-control",
		a = { "<cmd>Git add %<cr>", "Git add curFile" },
		b = { "<cmd>Git branch<cr>", "Git branch" },
		c = { "<cmd>Git commit -m ", "Git commit" },
		d = { "<cmd>Git diff<cr>", "Git diff" },
		f = { "<cmd>GitGutterFold<cr>", "Git fold"},
		i = { "<cmd>Git init<cr>", "Git init" },
		j = { "<cmd>GitGutterNextHunk<cr>", "Next Hunk" },
		k = { "<cmd>GitGutterPrevHunk<cr>", "Prev Hunk" },
		l = { "<cmd>Git log<cr>", "Git log" },
		p = { "<cmd>GitGutterPreviewHunk<cr>", "preview Hunk" },
		s = { "<cmd>Git status<cr>", "Git status" },
		u = { "<cmd>GitGutterUndoHunk<cr>", "Undo Hunk" },
		B = { "<cmd>Git Blame<cr>", "Git blame" },
		D = { "<cmd>Git difftool<cr>", "Git difftool" },
		L = { "<cmd>GitGutterLineHighlightsToggle<cr>", "GitLineHighlightsToggle" },
		P = { "<cmd>Git push<cr>", "Git push" },
		S = { "<cmd>GitGutterStageHunk<cr>", "Stage Hunk" },
	},
	["h"] = {
		name = "+help",
	},
	["j"] = {
		name = "+jump/json",
	},
	["l"] = {
		name = "LSP",
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
	},
	["m"] = {
		name = "+markdown",
		p = { "<cmd>MarkdownPreview<cr>", "markdown preview" },
		t = { "<cmd>TableModeToggle<cr>", "TableModeToggle" },
	},
	["n"] = {
		name = "+nerdtree",
		c = { "<cmd>NERDTree ~/haoran/Code<cr>", "Code" },
		d = { "<cmd>NERDTree ~/haoran/github-D<cr>", "github-D" },
		i = { "<cmd>NERDTree ~/haoran/TheInterview<cr>", "TheInterview" },
		m = { "<cmd>NERDTree ~/haoran/Notes/Markdown<cr>", "Markdown" },
		n = { "<cmd>NERDTreeFind<cr>", "Current Nerdtree" },
		o = { "<cmd>NERDTree ~/haoran/Code/Language/04-CSS/oh-my-css<cr>", "oh-my-css" },
		r = { "<cmd>NERDTree ~/haoran/github-R<cr>", "github-R" },
		s = { "<cmd>NERDTree ~/haoran/Code/Language/06-Scheme<cr>", "Scheme" },
		S = { "<cmd>e ~/haoran/Notes/Org/Programming/public/sicp/index.xhtml<cr>", "sicp.html" },
		w = { "<cmd>NERDTree ~/haoran/Code/NEXTLINE/wiki<cr>", "wiki" },
	},
	["o"] = {
		name = "+user bingdings",
		o = { "<cmd>!/opt/google/chrome/google-chrome % &<cr><cr>", "open in browser" },
		p = { "<cmd>!typora % &<cr><cr>", "open in typora" },
		y = { "<cmd>Ydc<cr>", "youdao single word" },
		Y = { "<cmd>Yde<cr>", "youdao input word" },
	},
	["p"] = {
		name = "+projects",
	},
	["q"] = {
		name = "+quit",
	},
	["r"] = {
		name = "+vimrc",
		c = { "<cmd>NERDTree ~/.config/nvim<cr>", "Reload vimrc" },
	},
	["s"] = {
		name = "+search/show",
		c = { "<cmd>nohl<cr>", "clear search highlight" },
	},
	["t"] = {
		name = "+terminal/toggle/tag",
		m = { "<cmd>TableModeToggle<cr>", "TableModeToggle" },
		n = { "<cmd>FloatermNew<cr>", "FloatermNew" },
	},
	["w"] = {
		name = "+window/wiki",
		H = { "<cmd>vertical resize-5<cr>", "size - 5" },
		J = { "<cmd>resize-5<cr>", "size - 5" },
		K = { "<cmd>resize+5<cr>", "size + 5" },
		L = { "<cmd>vertical resize+5<cr>", "size + 5" },
		N = { "<cmd>tabnew<cr>", "new tab" },
		o = { "<cmd>only<cr>", "window only" },
		q = { "<cmd>close<cr>", "window quit" },
		S = { "<cmd>sp<cr>", "- split" },
		V = { "<cmd>vsp<cr>", "| split" },
		w = {
			name = "+wiki",
			a = { "<cmd>VimwikiAll2HTML<cr>", "WikiAll2HTML" },
			d = { "<cmd>VimwikiDeleteFile<cr>", "WikiDeleteFile" },
			h = { "<cmd>Vimwiki2HTML<cr>", "Wiki2HTML" },
			i = { "<cmd>VimwikiIndex<cr>", "WikiIndex" },
			r = { "<cmd>VimwikiRenameFile<cr>", "WikiRenameFile" },
			s = { "<cmd>VimwikiUISelect<cr>", "WikiUISelsect" },
			t = { "<cmd>VimwikiTabIndex<cr>", "WikiTabIndex" },
		}
	},
	["x"] = {
		name = "+text",
		d = { "<cmd>%s/\\s\\+$//e<cr>", "clear white-space" },
	}
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mapping
	silent = true, -- use `silent` when creating keymap
	noremap = true, -- use `noremap` when creating keymap
	nowait = true, -- use `nowait` when creating keymap
}

local vmappings = {
	["o"] = {
		name = "+user binding",
		y = { "<cmd>Ydv<cr>", "youdao translation" },
	},
}

local ignoreopts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mapping
	silent = true, -- use `silent` when creating keymap
	noremap = true, -- use `noremap` when creating keymap
	nowait = true, -- use `nowait` when creating keymap
}

local ignoremappings = {
	["0"] = "which_key_ignore",
	["<leader>"] = "which_key_ignore",
	["<cr>"] = "which_key_ignore",
}

which_key.setup(setup)
which_key.register(nmappings, nopts)
which_key.register(ignoremappings, ignoreopts)
-- which_key.register(vmappings, vopts)   -- a little bug
