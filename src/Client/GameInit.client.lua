--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")

-- Imports
local ModuleLoader = require(ReplicatedStorage.Shared.ModuleLoader)

ModuleLoader.LoadModules(StarterPlayer.StarterPlayerScripts.Controllers)
ModuleLoader.LoadComponents(StarterPlayer.StarterPlayerScripts.Components)
