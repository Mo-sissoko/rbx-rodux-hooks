local Roact = require(script.Parent.Parent.Parent.Roact)
local Context = require(script.Parent.Parent.Context)

local useContext = Roact.useContext

return function()
	return useContext(Context)
end
