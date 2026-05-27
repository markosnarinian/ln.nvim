local M = {}

M.config = {
    absolute_events = { "WinLeave", "InsertEnter", "TermEnter", "CmdlineEnter" },
    relative_events = { "WinEnter", "InsertLeave", "TermLeave", "CmdlineLeave" },
    exclude = {
        "TelescopePrompt",
        "lazy",
        "mason",
        "checkhealth",
        "help",
        "Trouble",
        "fzf",
        "toggleterm",
        "startify",
        "undotree",
        "dashboard",
        "snacks_dashboard",
    },
}

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})

    vim.o.number = true
    vim.o.relativenumber = false
    vim.wo.relativenumber = true

    local group = vim.api.nvim_create_augroup("ln", { clear = true })

    vim.api.nvim_create_autocmd(M.config.absolute_events, {
        group = group,
        callback = function(ev)
            vim.wo.relativenumber = false
            if ev.event == "CmdlineEnter" then
                vim.cmd("redraw")
            end
        end,
    })

    vim.api.nvim_create_autocmd(M.config.relative_events, {
        group = group,
        callback = function(ev)
            vim.wo.relativenumber = true
            if ev.event == "CmdlineLeave" then
                vim.cmd("redraw")
            end
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = M.config.exclude,
        callback = function()
            vim.wo.number = false
            vim.wo.relativenumber = false
        end,
    })
end

return M
