vim.pack.add { 'https://gitlab.com/protesilaos/tempus-themes-vim' }
vim.g.tempus_enforce_background_color = 0

-- Let Ghostty's background-opacity show through. The colorscheme paints an
-- explicit background on these groups, and a cell with an explicit background
-- is opaque no matter what the terminal's opacity is set to. Clearing them
-- falls back to the terminal's default background, which is the transparent
-- one. Re-applied on every ColorScheme so it survives a colorscheme reload.
local function clear_backgrounds()
    for _, group in ipairs {
        'Normal',
        'NormalNC',
        'NormalFloat',
        'FloatBorder',
        'SignColumn',
        'LineNr',
        'FoldColumn',
        'EndOfBuffer',
    } do
        vim.api.nvim_set_hl(0, group, vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = group }), { bg = 'NONE', ctermbg = 'NONE' }))
    end
end

vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('transparent-background', { clear = true }),
    callback = clear_backgrounds,
})

vim.cmd.colorscheme 'tempus_totus'
