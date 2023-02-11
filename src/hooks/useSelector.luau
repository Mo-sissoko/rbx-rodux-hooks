local Roact = require(script.Parent.Parent.Parent.Roact)
local useStore = require(script.Parent.useStore)

local useState = Roact.useState
local useEffect = Roact.useEffect
local useRef = Roact.useRef

local function defaultIsEqual<T>(a: T, b: T): boolean
    return a == b
end

type EqualityFn<T> = typeof(defaultIsEqual)

return function<S, T>(selector: (S) -> T, equalityFn: EqualityFn<T>?): T
    local store = useStore()
    local isEqual: EqualityFn<T> = equalityFn or defaultIsEqual

    local selectedState, setSelectedState = useState(function()
        return selector(store:getState())
    end)

    local oldSelectedState = useRef(selectedState)

    useEffect(function()
        local function onStateChanged(newState)
            local newSelectedState = selector(newState)

            if not isEqual(newSelectedState, oldSelectedState.current :: T) then
                oldSelectedState.current = newSelectedState
                setSelectedState(newSelectedState)
            end
        end

        local connection = store.changed:connect(onStateChanged)

        onStateChanged(store:getState())

        return function()
            connection:disconnect()
        end
    end, { store })

    return selectedState
end
