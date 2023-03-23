local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  }) vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- 前往定义处
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- 在哪里被使用了？C-r
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- 悬浮窗口查看光标下变量信息
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- 实现(interface)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "ge", '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- 错误的详细信息
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) -- lsp 的帮助手册，不知道咋用
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- 重命名
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- 报错地方的建议
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cj", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ck", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- 禁用格式化功能，交给专门插件插件处理
M.disableFormat = function(client)
    if vim.fn.has("nvim-0.8") == 1 then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    else
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end
end

M.on_attach = function(client, bufnr)
  -- 下面被注释的几行是停止 lsp 补全的 :h cmp-nvim-lsp
  -- if client.name == "tsserver" or client.name == "clangd" then
    -- client.server_capabilities.document_formatting = false
  -- end
  lsp_keymaps(bufnr) -- 按键绑定
  lsp_highlight_document(client) -- 使用 lsp 的高亮

  local status_ok, lsp_signature = pcall(require, "lsp_signature")
  if status_ok then
    lsp_signature.on_attach()
  end
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities() -- 赋予它 cmp-nvim-lsp 的能力！虽然我也不太懂能干啥。
return M
