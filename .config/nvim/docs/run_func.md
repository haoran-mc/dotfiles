```lua
function Ranzz()
    win_height = vim.fn.winheight(0)
    print(win_height)
end

vim.keymap.set("n", "<leader>r", Ranzz, { noremap = true, silent = true })
```

```lua
:lua MyFunction("value1", "value2")
```
