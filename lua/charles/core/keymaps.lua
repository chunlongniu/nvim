vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

-- keymap.set("i",  "jk", "<ESC>", {desc = "Exist insert model with jk"})
keymap.set("n",  "<leader>nh", ":nohl<CR>", {desc = "clear search highlights, leader equal space"})

-- increment/decrement numbers
keymap.set("n",  "<leader>+", "<C-a>", {desc = "Increment number"})
keymap.set("n",  "<leader>-", "<C-x>", {desc = "Decrement number"})

-- window management
keymap.set("n",  "<leader>sv", "<C-w>v", {desc = "Split window vertically"}) -- split window vertically
keymap.set("n",  "<leader>sh", "<C-w>s", {desc = "Split window horizontatlly"}) -- split window horizontally
keymap.set("n",  "<leader>se", "<C-w>=", {desc = "Make splits equal size"}) -- make split windows equalt size
keymap.set("n",  "<leader>sx", "<cmd>close<CR>", {desc= "Close current split"})

keymap.set("n",  "<leader>to", "<cmd>tabnew<CR>", {desc= "Open new tab"})
keymap.set("n",  "<leader>tx", "<cmd>tabclose<CR>", {desc= "Close current tab"})
keymap.set("n",  "<leader>tn", "<cmd>tabn<CR>", {desc= "Go to next tab"})
keymap.set("n",  "<leader>tp", "<cmd>tabp<CR>", {desc= "Go to previous tab"})
keymap.set("n",  "<leader>tf", "<cmd>tabnew %<CR>", {desc= "Open current buffer in new tab"})

-- ***********************window panel management ***********************
-- pane management resize
keymap.set('n', '<C-Up>', ':resize +2<CR>')
keymap.set('n', '<C-Down>', ':resize -2<CR>')
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')
-- panel maxsize
keymap.set('n', '<leader>mo', '<C-w>o')
keymap.set('n', '<leader>mh', '<C-w>_')
keymap.set('n', '<leader>mw', '<C-w>|')
keymap.set('n', '<leader>me', '<C-w>=')

-- ***********************end ***********************

-- bufferline
keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { silent = true })
keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { silent = true })

-- terminal
-- ctrl+ \ then ctrl+ n back to nornamal
keymap.set('n', '<leader>th', '<cmd>split | terminal<CR>')
keymap.set('n', '<leader>tv', '<cmd>vsplit | terminal<CR>')
