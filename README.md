# Rodux Hooks
This project takes inspiration from [solarhorizon/rodux-hooks](https://github.com/solarhorizon/rodux-hooks) in order to make it work with [React](https://github.com/jsdotlua/react-lua).

## Setup
```lua
local RoduxHooks = require(path.to.RoduxHooks)
local store = require(path.to.store)

local useStore = RoduxHooks.useStore
local useSelector = RoduxHooks.useSelector
local useDispatch = RoduxHooks.useDispatch
```

## Api
```lua
useStore(): Store
```

```lua
useSelector<S, T>(selector: (S) -> T, equalityFn: ((T, T) -> boolean)?): T
```

```lua
useDispatch(): (action: AnyAction) -> ()
```

## Examples
```lua
local root = e(RoduxHooks.Provider, {
    store = store,
}, {
    app = e(App),
})

local root = ReactRoblox.createRoot(Instance.new("Folder"))
root:render(ReactRoblox.createPortal(root, playerGui))
```
```lua
local function MyComponent()
    local counter = useSelector(function(state: store.State)
        return state.counter
    end)

    return e("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(200, 100),
        Text = `Count: {counter}`,
    })
end
```

## Contributing
In order to get proper completion, use `dev.project.json` to build `sourcemap.json`
```
rojo sourcemap dev.project.json --output sourcemap.json
```
