-- Standard nvim options
require("alyu.options")

-- Define keymaps
require("alyu.keymaps")

-- Init lazy
require("alyu.lazy-init")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
