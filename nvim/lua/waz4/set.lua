vim.g.mapleader = " "

-- Netrw Bind
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remove Swapfiles
vim.opt.swapfile = false

-- Center After Big moves in file
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Tab condifg
vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting

-- Hybrid Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Clear Highlight after search
vim.keymap.set("n", "<leader>/", vim.cmd.nohlsearch)

-- Toggle neotree with <leader>b
vim.keymap.set("n", "<leader>b", function()
    vim.cmd.Neotree("toggle", "reveal")
end)
-- Format File or range with leader shift f (F)
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
    vim.cmd("LspRestart")
end)

