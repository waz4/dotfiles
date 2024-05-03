-- Require the dashboard module
local db = require('dashboard')

db.setup({
    theme = 'hyper',
    config = {
        header = DASHBOARD_HEADERS[math.random(#DASHBOARD_HEADERS)],
        packages = { enable = false },
        shortcut = {
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'File Tree',
                group = 'Label',
                action = 'Neotree toggle',
                key = 'b',
            },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Number',
                action = 'Telescope find_files',
                key = 'f',
            },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'File Tree',
                group = 'Label',
                action = 'qa',
                key = 'q',
            },
        },
        mru = {},
        projects = {},
    footer = {[[]],[[]],"Waza is Love! "},
    },
})
