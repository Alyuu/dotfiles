return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        require'hop'.setup{}
        local hop = require('hop')
		vim.keymap.set('n', '<leader><leader>s', hop.hint_char1, { desc = "Hop [S]ingle char" })
		vim.keymap.set('n', '<leader><leader>/', hop.hint_patterns, { desc = "Hop search" })
		vim.keymap.set('n', '<leader><leader>c', hop.hint_char2, { desc = "Hop 2 [C]hars" })
		vim.keymap.set('n', '<leader><leader>l', hop.hint_lines, { desc = "Hop [L]ine" })
    end
}
