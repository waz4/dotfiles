local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', '<leader>pr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
end)

require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

-- Setup Autocomplete
local cmp = require('cmp')

cmp.setup({
    preselect = 'item',

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        ['<S-Space>'] = cmp.mapping.confirm({ select = false }),       -- Shift Space to confirm Autocomplete
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }), -- Tab to move to next option
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }), -- Shift Tabb to move to previous option
    },
})
