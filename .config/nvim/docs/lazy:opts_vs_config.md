opts 是纯静态的，如果没有特殊的处理，就可以在 opts 写静态的配置，lazy nvim 会自动 require 插件并用 opts 来 setup。

如果有构造时候的编程需求，可以在 config 这个回调里手动 require 插件，opts table 可以作为 config 函数的第二个参数，然后 setup 这个插件。

```lua
config = function(_, opts)
    ...
end
```

