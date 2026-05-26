# ln.nvim

Automatically switches between relative and absolute line numbers based on context. The active window shows relative line numbers for easy motion; inactive windows show absolute line numbers for reference.

## Installation

### With lazy.nvim

```lua
-- default configuration
{
    "markosnarinian/ln.nvim",
    opts = {
        absolute_events = { "WinLeave", "InsertEnter", "TermEnter", "CmdlineEnter" },
        relative_events = { "WinEnter", "InsertLeave", "TermLeave", "CmdlineLeave" },
        neotree_force_relative = false,
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
    },
}
```

You can add or remove any standard Neovim autocmd events from either list to customise when each mode activates.
You can also add or remove buffer types and file types from the exclude list as you like.

# Contributing

All contributions are welcome! I promise that I will take the time to review your PR.
