--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Component = require(ReplicatedStorage.Packages.Component)
local Knit = require(ReplicatedStorage.Packages.Knit)
local Trove = require(ReplicatedStorage.Packages.Trove)

-- Component Documentation: https://sleitnick.github.io/RbxUtil/api/Component/
local SparkleEffect = Component.new({
	Tag = "SparkleEffect",
	Ancestors = { Workspace },
})

function SparkleEffect:Construct()
	assert(self.Instance:IsA("BasePart") or self.Instance:IsA("Attachment"))
	self.Trove = Trove.new()
	self.Sparkles = Instance.new("Sparkles")
	self.LastColorTime = 0
end

function SparkleEffect:Start()
	local sparkles: Sparkles = self.Sparkles
	sparkles.Parent = self.Instance
	self.Trove:Add(sparkles)
end

function SparkleEffect:Stop()
	self.Trove:Clean()
end

function SparkleEffect:HeartbeatUpdate()
	-- Updates the color every second.
	if time() - self.LastColorTime >= 1 then
		local sparkles: Sparkles = self.Sparkles
		sparkles.SparkleColor = Color3.fromHSV((time() % 10) / 10, 1, 1)
		self.LastColorTime = time()
	end
end

return SparkleEffect
