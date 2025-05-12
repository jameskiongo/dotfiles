-- set leader key to space
--
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })
keymap.set("i", "jl", "<ESC>o", { desc = "Insert newline below" }) -- insert newline below
keymap.set("i", "jb", "<ESC>i", { desc = "Insert previous char to the left" })
keymap.set("i", "j;", "<ESC>$a", { desc = "Insert to the end of the line" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

keymap.set("n", "U", "<C-r>", { desc = "Redo" }) -- redo
keymap.set("n", "<leader>sl", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap" }) -- toggle line wrap

keymap.set("n", "md", ":move+<CR>", { silent = true, noremap = true }) -- move line up(n)
keymap.set("n", "mu", ":move-2<CR>", { silent = true, noremap = true }) -- move line up(n)
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- launch lazy
keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Launch lazy" })
keymap.set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Launch Mason" })
--lualine buffers
keymap.set("n", "tn", "<cmd>bnext<CR>", { desc = "next buffers" })
keymap.set("n", "tp", "<cmd>bprevious<CR>", { desc = "previous buffers" })
keymap.set("n", "td", "<cmd>bd<CR>", { desc = "delete buffer" })
keymap.set("n", "tl", "<cmd>Telescope buffers<CR>", { desc = "list buffers" })

--quickfix list
keymap.set("n", "<leader>qq", ":copen<CR>", { desc = "Open quickfix list" })
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- files
keymap.set("n", "E", "$", { noremap = false }) -- move to end of line
keymap.set("n", "B", "^", { noremap = false }) -- move to beginning of line

--obsidian
keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", {
	desc = "Search notes in Obsidian vault",
})
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", {
	desc = "Create new note in Obsidian vault",
})
keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", {
	desc = "Create today's note in Obsidian vault",
})
keymap.set("n", "<leader>ol", "<cmd>ObsidianLinkNew<CR>", {
	desc = "Create new note in Obsidian vault with link",
})
keymap.set("n", "<leader>of", "<cmd>ObsidianFollowLink<CR>", {
	desc = "Follow link in Obsidian vault",
})
