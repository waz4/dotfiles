vim.opt.termguicolors = true

local bufferline = require("bufferline")
bufferline.setup {}

vim.keymap.set('n', '<leader>]', function() vim.cmd("BufferLineCycleNext") end, {})
vim.keymap.set('n', '<leader>[', function() vim.cmd("BufferLineCyclePrev") end, {})

for i = 1, 9, 1 do
  vim.keymap.set('n', string.format('<leader>%d', i), function() vim.cmd(string.format("BufferLineGoToBuffer %d", i) ) end, {})
end
