--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

-- Imports
local Knit = require(ReplicatedStorage.Packages.Knit)
local ModuleLoader = require(ReplicatedStorage.Shared.ModuleLoader)

ModuleLoader.LoadModules(ServerScriptService.Services)
Knit.Start():expect()
ModuleLoader.LoadModules(ServerScriptService.Components)
