```
local Fusion = require(ReplicatedStorage.Fusion)

local New = Fusion.New
local State = Fuson.State
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed

local Points = State(0)
local Message = Computed(function()
       return "You have " .. Points:get() .. " points."
end)

-- This is a simple incrementing counter button.

New {
   Name = "Button",
   Text = Message,
   Size = UDim2.new(0, 200, 0, 200),
   Position = UDim2.new(0.5, 0, 0.5, 0),
   AnchorPoint = Vector2.new(0.5, 0.5),

   Parent = script.Parent.ScreenGui, -- This is assuming one exists, in practice it would be created with Fusion as well.

   [OnEvent "Clicked"] = function()
         Points:set(Points:get() + 1)
   end
}
```
