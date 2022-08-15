local loaded, indent_blankline = pcall(require, "indent_blankline")
if not loaded then
    return
end

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

indent_blankline.setup {
    use_treesitter = true,
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
}
