local Roact = require(script.Parent.Parent.Roact)
local Context = require(script.Parent.Context)

type Props = {
    store: unknown,
}

return function(props: Props)
    return Roact.createElement(Context.Provider, {
        value = props.store,
    }, props[Roact.Children])
end
