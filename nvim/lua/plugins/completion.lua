-- [[ Snippet Engine ]]
-- NOTE: You can also specify plugin using a version range for its git tag.
--  See `:help vim.version.range()` for more info

-- [[ Autocomplete Engine ]]
vim.pack.add { { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' } }
require('blink.cmp').setup {
    keymap = {
        preset = 'default',
    },

    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets' },
    },

    snippets = { preset = 'default' },

    fuzzy = { implementation = 'lua' },

    signature = { enabled = true },
}
