return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        require'hop'.setup{}
        local hop = require('hop')
		vim.keymap.set('n', '<leader><leader>s', '<cmd>lua require"hop".hint_char2()<cr>', { desc = "Hop anywhere" })
		vim.keymap.set('n', '<leader><leader>l', '<cmd>lua require"hop".hint_lines()<cr>', { desc = "Hop line" })
    end
}
