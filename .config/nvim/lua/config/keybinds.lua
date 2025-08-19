vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>y', '"+yy', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
