--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Promise = require(ReplicatedStorage.Packages.Promise)

local ModuleLoader = {}

function ModuleLoader.InitModules(modules)
	local initPromises = {}

	for _, module in modules do
		table.insert(
			initPromises,
			Promise.new(function(resolve)
				if module.Init then
					module:Init()
				end
				resolve(module)
			end)
		)
	end

	return Promise.all(initPromises)
end

function ModuleLoader.StartModules(modules)
	for _, module in modules do
		if module.Start and typeof(modules.Start) then
			task.spawn(module.Start, module)
		end
	end

	return Promise.resolve()
end

function ModuleLoader.LoadModules(root: Instance)
	local modules = {}

	for _, child: Instance in root:GetChildren() do
		if child:IsA("ModuleScript") then
			table.insert(modules, require(child))
		end
	end

	return ModuleLoader.InitModules(modules):andThen(ModuleLoader.StartModules)
end

function ModuleLoader.LoadComponents(root: Instance)
	for _, child in root:GetChildren() do
		if child:IsA("ModuleScript") then
			require(child)
		end
	end
end

return ModuleLoader
