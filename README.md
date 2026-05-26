# ln.nvim

Automatically switches between relative and absolute line numbers based on window focus. Active window shows relative numbers; inactive windows show absolute.

## Installation

### With lazy.nvim

```lua
{
    "markosnarinian/ln.nvim",
    opts={},
}
```

Default config:

```lua
{
  "markosnarinian/ln.nvim",
  opts = {
    absolute_events = { "WinLeave", "InsertEnter", "TermEnter", "CmdlineEnter" },
    relative_events = { "WinEnter", "InsertLeave", "TermLeave", "CmdlineLeave" },
    neotree_force_relative = true,
  }
}
```
