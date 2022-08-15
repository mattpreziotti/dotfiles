local function cwd()
    local path = vim.fn.getcwd()
    return path:sub(path:find("/[^/]*$") + 1)
end

require('lualine').setup {
    options = {
        theme = 'tokyonight',
        globalstatus = true
    },
    sections = {
        lualine_c = { cwd, {
            'filename',
            path = 1
        }},
        lualine_x = { },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = { },
    },
    extensions = {'nvim-tree'}
}
