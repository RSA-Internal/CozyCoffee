--!strict
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

-- Knit Controller Documentation: https://sleitnick.github.io/Knit/docs/controllers
local PlayerSparkleController = { Name = "PlayerSparkleController" }

function PlayerSparkleController:KnitInit()
	self.PlayerSparkleService = Knit.GetService("PlayerSparkleService")
end

function PlayerSparkleController:KnitStart()
	Players.LocalPlayer.CharacterAdded:Connect(function()
		print("[PlayerSparkleController] Adding sparkles")
		self:SetSparkling(true)
	end)

	task.defer(function()
		while true do
			print("[PlayerSparkleController] Sparkling state", self.PlayerSparkleService:IsSparkling())
			task.wait(10)
		end
	end)

	print("[PlayerSparkleController] Controller started")
end

function PlayerSparkleController:SetSparkling(shouldSparkle: boolean)
	self.PlayerSparkleService.SetSparkling:Fire(shouldSparkle)
end

Knit.CreateController(PlayerSparkleController)
return PlayerSparkleController
