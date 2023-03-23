local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return
end

local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
  return
end

-- luasnip
require("luasnip.loaders.from_snipmate").lazy_load() -- snippets
luasnip.config.set_config({
  store_selection_keys = '<tab>'
})

CMP_CONFIG = {
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  completion = {
    ---@usage The minimum length of a word to complete on.
    keyword_length = 1,
  },
  experimental = { -- 过期
    ghost_text = false,
    native_menu = false,
  },
  matching = {
    disallow_fuzzy_matching = true, -- 不允许模糊匹配
  },
  formatting = {
    fields = { "kind", "abbr", "menu" }, -- 修改哪些部分？
    max_width = 0,
    kind_icons = {
      Class = " ",
      Color = " ",
      Constant = "ﲀ ",
      Constructor = " ",
      Enum = "練",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = "",
      Folder = " ",
      Function = " ",
      Interface = "ﰮ ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Operator = "",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = "塞",
      Value = " ",
      Variable = " ",
    },
    source_names = {
      nvim_lsp = "(LSP)",
      emoji = "(Emoji)",
      path = "(Path)",
      calc = "(Calc)",
      cmp_tabnine = "(Tabnine)", -- cmp-tabnine
      vsnip = "(Snippet)", -- vsnip
      luasnip = "(Snippet)", -- luasnip
      buffer = "(Buffer)",
      spell = "(Spell)",
    },
    duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = 0,
      luasnip = 1,
    },
    duplicates_default = 0,
    format = function(entry, vim_item) -- format
      local max_width = CMP_CONFIG.formatting.max_width -- 最大长度
      -- ~= 不等于，abbr 缩写，过长的补全使用 …
      if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
      end
      vim_item.kind = CMP_CONFIG.formatting.kind_icons[vim_item.kind] -- 图标
      vim_item.menu = CMP_CONFIG.formatting.source_names[entry.source.name] -- 来源名
      vim_item.dup = CMP_CONFIG.formatting.duplicates[entry.source.name]
          or CMP_CONFIG.formatting.duplicates_default
      return vim_item
    end,
  },
  snippet = { -- :h cmp
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = { -- :h cmp
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = { -- 数据源
    { name = "nvim_lsp" }, -- nvim-lsp
    { name = "path" },
    { name = "luasnip" }, -- luasnip
    { name = "cmp_tabnine" }, --- cmp-tabnine
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "spell" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" }, -- treesitter
    { name = "crates" },
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then -- 先进行扩展
        luasnip.expand_or_jump()
      elseif cmp.visible() then -- 如果补全窗口是可视的
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline' }
  }, {
    { name = 'path' }
  })
})

-- disable autocompletion for guihua
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")

cmp.setup(CMP_CONFIG)
