local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

