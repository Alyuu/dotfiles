return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        require'hop'.setup{}
        local hop = require('hop')
		vim.keymap.set('n', '<leader><leader>s', hop.hint_patterns, { desc = "Hop [S]earch" })
		vim.keymap.set('n', '<leader><leader>c', hop.hint_char2, { desc = "Hop 2 [C]hars" })
		vim.keymap.set('n', '<leader><leader>l', hop.hint_lines, { desc = "Hop [S]ine" })
    end
}
