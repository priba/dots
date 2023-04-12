vim.keymap.set("i", "<C-c>", "<Esc>") -- jk to escape

-- general maps
vim.keymap.set("i", "<C-k>", "<C-o>d$", { silent = true }) -- delete until end of line
vim.keymap.set("n", "<C-k>", "d$", { silent = true }) -- delete until end of line
vim.keymap.set("", "<leader>w", ":w<CR>", { silent = true }) -- save with leader`
vim.keymap.set("", "<leader>qa", ":qall!<CR>", { silent = true }) -- quit all
vim.keymap.set("", "<leader>qw", ":q<CR>", { silent = true }) -- quit (write as its save automatically)
-- Close the current buffer and move to the previous one. This replicates the idea of closing a tab, however be warned it will close without saving anything!
vim.keymap.set("", "<leader>qq", ":bp <BAR> bd! #<CR>")

-- Navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>") -- Move to the next buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>") -- Move to the previous buffer
-- -- Moving between splits with arrow keys, sorry Vim, I don't deserve you :(
-- -- Check this for MacOS: https://apple.stackexchange.com/questions/341993/macos-can-i-disable-f12-ctrl-left-arrow-ctrl-right-arrow 
-- vim.keymap.set("n", "<C-Down>", "<C-W><C-J>")
-- vim.keymap.set("n", "<C-Up>", "<C-W><C-K>")
-- vim.keymap.set("n", "<C-Left>", "<C-W><C-H>")
-- vim.keymap.set("n", "<C-Right>", "<C-W><C-L>")

-- copy pasting
vim.keymap.set({ "n", "v" }, "<leader>y", "+y")

-- Terminal Settings
-- vim.keymap.set({"n", "t"}, "<Esc>", "<C-Bslash><C-n>`.$", { silent = true })
vim.keymap.set({"n", "t"}, "<A-left>", "<C-Bslash><C-n><C-w>h")
vim.keymap.set({"n", "t"}, "<A-down>", "<C-Bslash><C-n><C-w>j")
vim.keymap.set({"n", "t"}, "<A-up>", "<C-Bslash><C-n><C-w>k")
vim.keymap.set({"n", "t"}, "<A-right>", "<C-Bslash><C-n><C-w>l")

-- vim.cmd("autocmd BufEnter term://* startinsert")

-- Move current line up and down
vim.keymap.set("n", "<A-s>", ":m .+1<CR>==", {noremap=true})
vim.keymap.set("n", "<A-w>", ":m .-2<CR>==", {noremap=true} )
vim.keymap.set("i", "<A-s>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-w>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-s>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-w>", ":m '<-2<CR>gv=gv")

-- Select current line
vim.keymap.set("v", "<leader>se", "<ESC>^vg_")
vim.keymap.set("n", "<leader>se", "^vg_")

vim.keymap.set("n", "<leader>)", "ciw(<c-r>\")<ESC>") -- Surround with parenthesis
vim.keymap.set("n", "<leader>]", "ciw[<c-r>\"]<ESC>") -- Surround with parenthesis
vim.keymap.set("n", "<leader>}", "ciw{<c-r>\"}<ESC>") -- Surround with parenthesis

-- Delete word forward, counter of C-W in insert  
vim.keymap.set("i", "<C-q>", "<C-o>dw")
-- Rotate split horizontally
vim.keymap.set("n", "<leader>rh", "<C-w>t <C-w>K<CR>")
-- Rotate split vertically
vim.keymap.set("n", "<leader>rv", "<C-w>t <C-w>L<CR>")
