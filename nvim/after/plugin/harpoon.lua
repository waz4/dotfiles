local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
    settings = {
        save_on_toggle = true
    }
})

-- basic telescope configuration
local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

-- Harpoon List
vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

-- Harpoon builtin menu
vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Harpoon Add
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)

-- Harpoon Remove
-- vim.keymap.set("n", "<leader>hr", harpoon:list():remove(), {})

-- Harpoon Next and Previous
vim.keymap.set("n", "<leader>N", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end)

-- Harpoon to index
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)

vim.keymap.set("n", "<leader>d1", function() harpoon:list():removeAt(1) end)
