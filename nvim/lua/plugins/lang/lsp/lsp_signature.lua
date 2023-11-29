-- show function signature
return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  dependenies = "hrsh7th/nvim-cmp",
  config = function()
    require("lsp_signature").setup(
      {
        log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        doc_lines = 0, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default
        wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

        floating_window_off_x = 1, -- adjust float windows x position.
        floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

        close_timeout = 4000, -- close floating window after ms when laster parameter is entered
        hint_enable = false, -- virtual hint enable
        hint_prefix = "» ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
        handler_opts = {
          border = "single"   -- double, rounded, single, shadow, none
        },

        transparency = 0, -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 0, -- if you using shadow as border use this set the opacity
        shadow_guibg = 'none', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
      }
    )
  end
}
