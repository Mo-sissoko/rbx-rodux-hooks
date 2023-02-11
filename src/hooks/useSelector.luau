local Roact = require(script.Parent.Parent.Parent.Roact)
local useStore = require(script.Parent.useStore)

local useState = Roact.useState
local useEffect = Roact.useEffect
local useRef = Roact.useRef

local function defaultIsEqual<T>(a: T, b: T): boolean
	return a == b
end

return function<S, T>(selector: (S) -> T, equalityFn: ((T, T) -> boolean)?): T
	local store = useStore()
	local isEqual = equalityFn or defaultIsEqual

	local selectedState, setSelectedState = useState(function()
		return selector(store:getState())
	end)

	local oldSelectedState = useRef(selectedState)

	useEffect(function()
		local function onStateChanged(newState)
			local newSelectedState = selector(newState)

			if not isEqual(newSelectedState, oldSelectedState.current) then
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
