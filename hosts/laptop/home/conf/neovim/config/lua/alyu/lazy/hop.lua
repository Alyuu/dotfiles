return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        local hop = require('hop')
        local directions = require('hop.hint').HintDirection
		vim.keymap.set('n', '<leader><leader>s', hop.hint_anywere(), { desc = "Hop anywhere" })
		vim.keymap.set('n', '<leader><leader>l', hop.hint_anywere(), { desc = "Hop line" })
    end
}
