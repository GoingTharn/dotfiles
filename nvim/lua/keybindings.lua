-- Abbreviate common 
vim.cmd 'command! PI PackerInstall'
vim.cmd 'command! PS PackerSync'
vim.cmd 'command! PST PackerStatus'
vim.cmd 'command! LSP LspInstall'
vim.cmd 'command! LS Mason'

-- Alias most permutations of capitalized 'wqa' commands to work.
vim.cmd 'command! Q q'
vim.cmd 'command! W w'
vim.cmd 'command! WQ wq'
vim.cmd 'command! Wq wq'
vim.cmd 'command! WA wa'
vim.cmd 'command! Wa wa'
vim.cmd 'command! QA qa'
vim.cmd 'command! Qa qa'
vim.cmd 'command! Wqa wqa'
vim.cmd 'command! WQa wqa'
vim.cmd 'command! WQA wqa'

-- Map <ctrl-arrow keys>  to go to the next and previous buffers.
vim.api.nvim_set_keymap('n', '<C-Right>', ':BufferLineCycleNext<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':BufferLineCyclePrev<cr>', { noremap = true })

-- Tmux/WinNav Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
map('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
map('n', "<A-p>", "<CMD>lua require('Navigator').previous()<CR>", opts)

-- Set <ctrl-<CR>> to open Telescope previous search.
-- vim.api.nvim_set_keymap('n', '<CR>', ':Telescope resume<cr>', { noremap = true })
-- Set <ctrl-p> to open Telescope file search.
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<cr>', { noremap = true })
-- Set <ctrl-g> to open Telescope grep.
vim.api.nvim_set_keymap('n', '<C-g>', ':Telescope live_grep<cr>', { noremap = true })
-- Set <ctrl-n> to toggle nvim-tree.
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })

-- Remap <ctrl-c> to <esc>. This prevents cmp-buffer from running into errors.
-- https://github.com/hrsh7th/cmp-buffer/issues/30#issuecomment-994011089
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>\\`^', { noremap = true })

-- Set <ctrl-n> to toggle nvim-tree.
vim.api.nvim_set_keymap('n', '<leader>b>', ':DlvAddBreakpoint<CR>', { noremap = true })

map('n', "gb", ":BufferLinePick<CR>", opts)
map('n', "gC", ":BufferLinePickClose<CR>", opts)
map('n', "<leader>t", ":GoTest %<CR>", opts)
map('n', "<leader>v", ":Vista nvim_lsp<CR>", opts)
map('n', "<leader>?", ":help nvim-tree-mappings-default<CR>", opts)


-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>C", function() harpoon:list():clear() end)
