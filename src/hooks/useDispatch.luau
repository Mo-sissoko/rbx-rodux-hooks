local React = require(script.Parent.Parent.Parent.React)
local useStore = require(script.Parent.useStore)

local useCallback = React.useCallback

return function()
    local store = useStore()

    local dispatch = useCallback(function(action)
        store:dispatch(action)
    end, { store })

    return dispatch
end
