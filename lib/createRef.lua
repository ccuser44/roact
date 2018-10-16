--[[
	Provides an API for acquiring a reference to a reified object. This
	API is designed to mimic React 16.3's createRef API.

	See:
	* https://reactjs.org/docs/refs-and-the-dom.html
	* https://reactjs.org/blog/2018/03/29/react-v-16-3.html#createref-api
]]

local Type = require(script.Parent.Type)

local refMetatable = {
	__tostring = function(self)
		return ("RoactRef(%s)"):format(tostring(self.current))
	end,
}

local function createRef()
	local ref = {
		[Type] = Type.Ref,
		current = nil,
	}

	setmetatable(ref, refMetatable)

	return ref
end

return createRef