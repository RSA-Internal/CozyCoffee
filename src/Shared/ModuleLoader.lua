--!strict
local ModuleLoader = { Debug = game:GetService("RunService"):IsStudio() }

function ModuleLoader.LoadModule(module: ModuleScript): (boolean, any)
	local path = module:GetFullName()
	local success, result = pcall(require, module)

	if not success then
		warn(
			debug.traceback(
				("[ModuleLoader] Module %q skipped, could not be loaded for reason: %s"):format(path, result)
			)
		)
		return false, result
	end

	local resultType = typeof(result)
	if resultType ~= "table" and resultType ~= "function" then
		warn(
			debug.traceback(
				("[ModuleLoader] Module %q loaded, but it did not return a table or function"):format(path, resultType)
			)
		)
	end

	if ModuleLoader.Debug then
		print(("[ModuleLoader] Module %q loaded (return type: %s)"):format(path, typeof(resultType)))
	end

	return true, result
end

function ModuleLoader.LoadModules(root: Instance)
	for _, child in ipairs(root:GetChildren()) do
		if child:IsA("Folder") then
			ModuleLoader.LoadModules(child)
		elseif child:IsA("ModuleScript") then
			ModuleLoader.LoadModule(child)
		end
	end
end

return ModuleLoader
