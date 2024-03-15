return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        require'hop'.setup{}
        local hop = require('hop')
		vim.keymap.set('n', '<leader><leader>s', hop.hint_anywhere(), { desc = "Hop anywhere" })
		vim.keymap.set('n', '<leader><leader>l', hop.hint_lines(), { desc = "Hop line" })
    end
}
