--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Remotes = require(ReplicatedStorage.Shared.Remotes)

local PlayerSparkleController = {}

function PlayerSparkleController:Start()
	Players.LocalPlayer.CharacterAdded:Connect(function()
		print("[PlayerSparkleController] Adding sparkles")
		self:SetSparkling(true)
	end)

	task.defer(function()
		while true do
			print("[PlayerSparkleController] Sparkling state", self:IsSparkling())
			task.wait(10)
		end
	end)
end

function PlayerSparkleController:SetSparkling(shouldSparkle: boolean)
	Remotes.Client:Get("SetSparkling"):SendToServer(shouldSparkle)
end

function PlayerSparkleController:IsSparkling()
	return Remotes.Client:Get("IsSparkling"):CallServerAsync()
end

return PlayerSparkleController
