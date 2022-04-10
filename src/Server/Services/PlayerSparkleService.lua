--!strict
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

-- Knit Service Documentation: https://sleitnick.github.io/Knit/docs/services
local PlayerSparkleService = Knit.CreateService({
	Name = "PlayerSparkleService",
	Client = {
		SetSparkling = Knit.CreateSignal(), -- shouldSparkle: boolean
	},
})

function PlayerSparkleService:KnitStart()
	self.Client.SetSparkling:Connect(function(player: Player, shouldSparkle: boolean)
		if typeof(shouldSparkle) ~= "boolean" then
			player:Kick()
			return
		end

		self:SetSparkling(player, shouldSparkle)
	end)

	print("[PlayerSparkleService] Service started")
end

function PlayerSparkleService:SetSparkling(player: Player, shouldSparkle: boolean)
	local rootPart = player.Character and player.Character.PrimaryPart

	if rootPart then
		if shouldSparkle then
			CollectionService:AddTag(rootPart, "SparkleEffect")
		elseif not shouldSparkle then
			CollectionService:RemoveTag(rootPart, "SparkleEffect")
		end
	end
end

function PlayerSparkleService:IsSparkling(player: Player)
	local rootPart = player.Character and player.Character.PrimaryPart

	if rootPart then
		return CollectionService:HasTag(rootPart, "SparkleEffect")
	else
		return false
	end
end

function PlayerSparkleService.Client:IsSparkling(player: Player)
	return self.Server:IsSparkling(player)
end

return PlayerSparkleService
