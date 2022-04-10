--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")

-- Imports
local Knit = require(ReplicatedStorage.Packages.Knit)
local ModuleLoader = require(ReplicatedStorage.Shared.ModuleLoader)

ModuleLoader.LoadModules(StarterPlayer.StarterPlayerScripts.Controllers)
Knit.Start({ ServicePromises = false }):expect()
ModuleLoader.LoadModules(StarterPlayer.StarterPlayerScripts.Components)
