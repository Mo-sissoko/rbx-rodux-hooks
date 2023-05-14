local Context = require(script.Parent.Parent.Context)
local React = require(script.Parent.Parent.Parent.React)

local useContext = React.useContext

return function()
    return useContext(Context)
end
