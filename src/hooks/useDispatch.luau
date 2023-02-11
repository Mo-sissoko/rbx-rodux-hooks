local Roact = require(script.Parent.Parent.Parent.Roact)
local useStore = require(script.Parent.useStore)

local useCallback = Roact.useCallback

return function()
    local store = useStore()

    local dispatch = useCallback(function(action)
        store:dispatch(action)
    end, { store })

    return dispatch
end
