-- Useful plugin to show you pending keybinds.
vim.pack.add { 'https://github.com/folke/which-key.nvim' }
require('which-key').setup {
    -- Delay between pressing a key and opening which-key (milliseconds)
    delay = 0,
    icons = { mappings = true },
    -- Document existing key chains
    spec = {
        { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle' },
        { 'gr', group = 'LSP Actions', mode = { 'n' } },
    },
}
