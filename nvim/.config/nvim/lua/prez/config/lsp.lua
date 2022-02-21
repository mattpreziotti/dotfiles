local nvim_lsp = require('lspconfig')
local utils = require('prez.utils')

-- LSP display settings
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
})

-- Pretty LSP Icons
local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    vim.fn.sign_define("LspDiagnosticsSign" .. type, { text = icon, numhl = ""})
end

local on_attach = function(client)

    -- Set omnifunc
    utils.opt('b', 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- go to remaps
    utils.map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')

    -- diagnostic remaps
    utils.map('n', '<leader>dk', '<cmd>lua vim.lsp.buf.hover()<CR>')
    utils.map('n', '<leader>dD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    utils.map('n', '<leader>dd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    utils.map('n', '<leader>da', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    utils.map('n', '<leader>dr', '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- workspace remaps
    utils.map('n', '<leader>dwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    utils.map('n', '<leader>dwd', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    utils.map('n', '<leader>dwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

    --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --buf_set_keymap('n', '<space>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        utils.map('n', '<leader>df', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    end
    if client.resolved_capabilities.document_range_formatting then
        utils.map('v', '<leader>df', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=grey
        hi LspReferenceText cterm=bold ctermbg=red guibg=grey
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=grey
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end

    -- LSP Signature
    require'lsp_signature'.on_attach({
        floating_window = false
    })
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
--require'lspinstall'.setup() -- important
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--local servers = require'lspinstall'.installed_servers()
--for _, lsp in ipairs(servers) do
--    nvim_lsp[lsp].setup {
--        on_attach = on_attach,
--        capabilities = capabilities,
--        settings = utils.get_settings(lsp)
--    }
--end

-- Setup trouble.nvim
require("trouble").setup()

-- Trouble mappings
utils.map('n', '<leader>dt', ':TroubleToggle<CR>')
