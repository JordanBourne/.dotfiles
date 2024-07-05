vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])

-- vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open undo tree' })
-- vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted text down one line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted text up one line" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "keep cursor in place when joining lines" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "keep cursor in middle while navigating down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "keep cursor in middle while navigating up" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

