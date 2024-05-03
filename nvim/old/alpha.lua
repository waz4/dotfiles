local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

dashboard.section.header.val = {
    [[ __      __                        ]],
    [[/  \    /  \_____  _____________   ]],
    [[\   \/\/   /\__  \ \___   /\__  \  ]],
    [[ \        /  / __ \_/    /  / __ \_]],
    [[  \__/\  /  (____  /_____ \(____  /]],
    [[       \/        \/      \/     \/ ]],
}
dashboard.section.buttons.val = {
    dashboard.button("t", "  File Tree", ":Neotree toggle <CR>"),
    dashboard.button("f", "  File Seach", ":Telescope find_files <CR>"),
    dashboard.button("t", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

dashboard.config.opts.noautocmd = true

--vim.cmd [[autocmd User AlphaReady echo 'ready']]

--alpha.setup(dashboard.config)
