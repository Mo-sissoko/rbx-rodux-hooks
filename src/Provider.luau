local Context = require(script.Parent.Context)
local React = require(script.Parent.Parent.React)

type Props = {
    store: unknown,
}

return function(props: Props)
    return React.createElement(Context.Provider, {
        value = props.store,
    }, props[React.Children])
end
