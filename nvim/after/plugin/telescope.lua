local telescope = require("telescope")
local builtin   = require('telescope.builtin')


telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

-- Find files by name
local find_files_opt = {}
vim.keymap.set('n', '<leader>pf', builtin.find_files, find_files_opt)

-- Find files by name in git
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Find text in current file
vim.keymap.set('n', '<leader>ps', builtin.current_buffer_fuzzy_find, {})

-- Show Jump List
vim.keymap.set('n', '<leader>jl', builtin.jumplist, {})

-- Delete selected buffer in show buffer
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

local buffer_searcher
buffer_searcher = function()
    builtin.buffers {
        sort_mru = true,
        ignore_current_buffer = true,
        show_all_buffers = false,
        attach_mappings = function(prompt_bufnr, map)
            local refresh_buffer_searcher = function()
                actions.close(prompt_bufnr)
                vim.schedule(buffer_searcher)
            end
            local delete_buf = function()
                local selection = action_state.get_selected_entry()
                vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                refresh_buffer_searcher()
            end
            local delete_multiple_buf = function()
                local picker = action_state.get_current_picker(prompt_bufnr)
                local selection = picker:get_multi_selection()
                for _, entry in ipairs(selection) do
                    vim.api.nvim_buf_delete(entry.bufnr, { force = true })
                end
                refresh_buffer_searcher()
            end
            map('n', '<leader>db', delete_buf)
            map('i', '<leader>db', delete_buf)
            --map('n', '<C-d>', delete_multiple_buf)
            --map('i', '<C-d>', delete_multiple_buf)
            return true
        end
    }
end

-- Show buffers
vim.keymap.set('n', '<leader>pb', buffer_searcher, {})


