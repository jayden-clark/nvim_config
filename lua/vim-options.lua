vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.nu = true
vim.wo.relativenumber = true
vim.g.mapleader = " "

vim.keymap.set("n", "<C-e>", vim.cmd.Ex)
vim.keymap.set("n", "<CS-j>", vim.cmd.terminal)

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Move highlighted region up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append line below to the end of the current line with a space while cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when moving up and down half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste contents in buffer without losing content in buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Select all of one word in insert mode
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "Q", "<nop>")

-- Display the branch of the current directory
_G.Gitbranch = function()
    local handle = io.popen("git branch --show-current 2> /dev/null")
    if not handle then return "" end
    local result = handle:read("*a")
    handle:close()
    return result:gsub("^%s*(.-)%s*$", "%1") -- Trim leading/trailing whitespace
end

vim.o.statusline = "%{expand('%:h:t')}/%t~(%{v:lua.Gitbranch()})"
