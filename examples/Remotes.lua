local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Net = require(ReplicatedStorage.Packages.Net)
local T = require(ReplicatedStorage.Packages.T)

return Net.CreateDefinitions({
	IsSparkling = Net.Definitions.ServerAsyncFunction(),
	SetSparkling = Net.Definitions.ClientToServerEvent({
		Net.Middleware.TypeChecking(T.boolean),
	}),
})
