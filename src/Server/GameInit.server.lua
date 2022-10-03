--!strict
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

-- Imports
local ModuleLoader = require(ReplicatedStorage.Shared.ModuleLoader)

ModuleLoader.LoadModules(ServerScriptService.Services)
ModuleLoader.LoadComponents(ServerScriptService.Components)
