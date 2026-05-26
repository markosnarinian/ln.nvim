# ln.nvim

Automatically switches between relative and absolute line numbers based on context. The active window shows relative line numbers for easy motion; inactive windows show absolute line numbers for reference.

## How it works

On setup, ln.nvim enables both `number` and `relativenumber` globally. It then listens to Neovim autocmd events to toggle `relativenumber` per window:

- **Relative numbers** are shown on the active, focused window in normal mode — ideal for `j`/`k` motions and operators like `d3j`.
- **Absolute numbers** are shown when you leave a window, enter insert mode, enter the terminal, or open the command line — so you always know the real line number when you need it.

The switch happens automatically with no extra keymaps or commands required.

### neo-tree support

When `neotree_force_relative = true` (the default), the neo-tree sidebar always gets relative line numbers after it opens, regardless of the other event rules.

## Installation

### With lazy.nvim

```lua
{
    "markosnarinian/ln.nvim",
    opts = {},
}
```

## Configuration

All options and their defaults:

```lua
{
  "markosnarinian/ln.nvim",
  opts = {
    -- Events that switch the active window to absolute line numbers
    absolute_events = { "WinLeave", "InsertEnter", "TermEnter", "CmdlineEnter" },
    -- Events that switch the active window back to relative line numbers
    relative_events = { "WinEnter", "InsertLeave", "TermLeave", "CmdlineLeave" },
    -- Force relative numbers in the neo-tree sidebar
    neotree_force_relative = true,
  },
}
```

You can add or remove any standard Neovim autocmd events from either list to customise when each mode activates.
