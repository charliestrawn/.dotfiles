vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Run Tests
vim.keymap.set("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
vim.keymap.set(
	"n",
	"<leader>tf",
	"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
	{ desc = "Run Test File" }
)
vim.keymap.set(
	"n",
	"<leader>td",
	"<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
	{ desc = "Run Current Test Directory" }
)
vim.keymap.set(
	"n",
	"<leader>tp",
	"<cmd>lua require('neotest').output_panel.toggle()<CR>",
	{ desc = "Toggle Test Output Panel" }
)
vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })

return {}
