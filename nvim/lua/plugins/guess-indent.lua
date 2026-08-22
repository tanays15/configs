vim.pack.add { 'https://github.com/NMAC427/guess-indent.nvim' }
require('guess-indent').setup {
    -- c/cpp are pinned to 2-space indent via after/ftplugin, don't let this override it
    filetype_exclude = { 'netrw', 'tutor', 'c', 'cpp' },
}
