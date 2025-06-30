if vim.fn.has 'nvim-0.9' == 1 then
    vim.opt.diffopt:append 'linematch:60' -- enable linematch diff algorithm
end

local options = {
    opt = {
        breakindent = true,
        clipboard = 'unnamed',
        expandtab = true,
        smartindent = true,
        autoindent = true,
        tabstop = 4,
        softtabstop = 4,
        shiftwidth = 4,
        textwidth = 120,
        wrapmargin = 0,
        wrap = true,
        linebreak = true,
        encoding = 'utf-8',
        fileencoding = 'utf-8',
        mouse = 'a',
        number = true,
        relativenumber = true,
        title = true, -- set terminal title to the file name and path
        undofile = true, -- enable persistant undo
        history = 100, -- number of commands to remember in a history table
        ignorecase = true,
        smartcase = true,
        infercase = true, -- infer cases in keyword completion
        foldcolumn = '1',
        foldenable = true,
        foldlevel = 99,
        foldlevelstart = 99, -- start with all code unfolded
        splitbelow = true,
        splitright = true,
        laststatus = 3, -- global statusline
        timeoutlen = 300, -- shorten key timeout length for which-key
        updatetime = 250, -- length of time to wait before triggering the plugin
        completeopt = { 'menu', 'menuone', 'noinsert' },
        termguicolors = true,
        fillchars = { fold = ' ', foldopen = '▾', foldsep = ' ', foldclose = '▸' },
    },
    g = {
        mapleader = ' ',
        localmapleader = ' ',
        max_file = { size = 1024 * 100, lines = 10000 },
        autoformat_enabled = true,
        autopairs_enabled = true,
        codelens_enabled = true,
        icons_enabled = true,
        lsp_handlers_enabled = true,
        semantic_tokens_enabled = true,
        ui_notifications_enabled = true,
        git_worktrees = nil,
    },
}

for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end

-- Autocmd formatoptions
vim.api.nvim_create_autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup('FormatOptions', { clear = true }),
    pattern = '*',
    callback = function()
        vim.opt.formatoptions = 'tcrqnj'
    end,
})
