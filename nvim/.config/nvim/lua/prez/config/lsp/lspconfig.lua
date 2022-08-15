local M = {}
local utils = require('prez.utils')

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
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
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

local function lsp_keymaps(client, bufnr)

    -- go to remaps
    -- utils.map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', bufnr)
    -- utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufnr)
    -- utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufnr)
    -- utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufnr)

    -- diagnostic remaps
    utils.map('n', '<leader>dk', '<cmd>lua vim.lsp.buf.hover()<CR>', bufnr)
    utils.map('n', '<leader>dD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufnr)
    utils.map('n', '<leader>dd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', bufnr)
    utils.map('n', '<leader>da', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufnr)
    utils.map('n', '<leader>dr', '<cmd>lua vim.lsp.buf.rename()<CR>', bufnr)

    -- workspace remaps
    -- utils.map('n', '<leader>dwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', bufnr)
    -- utils.map('n', '<leader>dwd', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', bufnr)
    -- utils.map('n', '<leader>dwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', bufnr)

    --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --buf_set_keymap('n', '<space>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        utils.map('n', '<leader>df', '<cmd>lua vim.lsp.buf.formatting()<CR>', bufnr)
    end
    if client.resolved_capabilities.document_range_formatting then
        utils.map('v', '<leader>df', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', bufnr)
    end
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(client, bufnr)
  lsp_highlight_document(client)
end

M.capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

return M
