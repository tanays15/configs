-- Harpoon: pin a short list of files and jump to them instantly
-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
vim.pack.add {
    'https://github.com/nvim-lua/plenary.nvim',
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
}

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, { desc = '[A]dd file to Harpoon' })
vim.keymap.set('n', '<leader>rm', function() harpoon:list():remove() end, { desc = '[R]e[m]ove file from Harpoon' })
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Toggle Harpoon menu' })

vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Harpoon to file 1' })
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Harpoon to file 2' })
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Harpoon to file 3' })
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Harpoon to file 4' })
