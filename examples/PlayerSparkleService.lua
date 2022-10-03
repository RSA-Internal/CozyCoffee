--!strict
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = require(ReplicatedStorage.Shared.Remotes)

local PlayerSparkleService = {}

function PlayerSparkleService:Start()
	Remotes.Server:Get("IsSparkling"):SetCallback(function(player: Player)
		return self:IsSparkling(player)
	end)

	Remotes.Server:Get("SetSparkling"):Connect(function(player: Player, shouldSparkle: boolean)
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

return PlayerSparkleService
