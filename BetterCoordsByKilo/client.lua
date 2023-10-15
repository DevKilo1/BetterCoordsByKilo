ShowNotificationTicker = function(message)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandDisplayHelp(0,0,1,-1)
end


RegisterCommand('vec2', function(source, args)
    if args[1] == "cs" then
        local coords = GetEntityCoords(PlayerPedId())

        SendNUIMessage({
            type = 'clipboard',
            data = 'new Vector2(' .. coords.x.. 'f, '.. coords.y..'f)'
        })
    ShowNotificationTicker('Copied to clipboard! ' .. 'new Vector2(' .. coords.x.. 'f, '.. coords.y..'f)')
        elseif args[1] == "json" then
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '{ \n["x"] = '.. coords.x..',\n["y"] = '..coords.y..',\n["z"] = '..coords.z..' \n}'
        })
        ShowNotificationTicker('Copied to clipboard! ' .. '{ ["x"] = '.. coords.x..', ["y"] = '..coords.y..' }')
        
    else
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '' .. vec(coords.x, coords.y)
        })
        ShowNotificationTicker('Copied to clipboard! ' .. vec(coords.x, coords.y))
    end
    
end,false)

RegisterCommand('vec3', function(source, args)
    if args[1] == 'cs' then
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = 'new Vector3(' .. coords.x.. 'f, '.. coords.y..'f, '..coords.z..'f)'
        })
        ShowNotificationTicker('Copied to clipboard! ' .. 'new Vector3(' .. coords.x.. 'f, '.. coords.y..'f, '..coords.z..'f)')
    elseif args[1] == "json" then
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '{ \n["x"] = '.. coords.x..',\n["y"] = '..coords.y..',\n["z"] = '..coords.z..' \n}'
        })
        ShowNotificationTicker('Copied to clipboard! ' .. '{ ["x"] = '.. coords.x..', ["y"] = '..coords.y..', ["z"] = '..coords.z..' }')
    else
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '' .. vec(coords.x, coords.y,coords.z)
        })
        ShowNotificationTicker('Copied to clipboard! ' .. vec(coords.x, coords.y,coords.z))    
    end
    
end,false)

RegisterCommand('vec4', function(source, args)
    if args[1] == 'cs' then
        local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = 'new Vector4(' .. coords.x.. 'f, '.. coords.y..'f, '..coords.z..'f, '..heading..'f)'
        })
        ShowNotificationTicker('Copied to clipboard! ' .. 'new Vector4(' .. coords.x.. 'f, '.. coords.y..'f, '..coords.z..'f, '..heading..'f)')
    elseif args[1] == "json" then
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '{ \n["x"] = '.. coords.x..',\n["y"] = '..coords.y..',\n["z"] = '..coords.z..',\n["w"] = '..GetEntityHeading(PlayerPedId())..' \n}'
        })
        ShowNotificationTicker('Copied to clipboard! ' .. '{ ["x"] = '.. coords.x..', ["y"] = '..coords.y..', ["z"] = '..coords.z..', ["w"] = '..GetEntityHeading(PlayerPedId())..' }')
    else
        local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '' .. vec(coords.x, coords.y,coords.z,heading)
        })
        ShowNotificationTicker('Copied to clipboard! ' .. vec(coords.x, coords.y,coords.z,heading))
    end

end,false)

TriggerEvent('chat:addSuggestion', '/vec2', "Add 'cs' for the C# version. Example Usage:  '/vec2 cs'", {
	{
		name = "args",
		help = "cs, json"
	}
})
TriggerEvent('chat:addSuggestion', '/vec3', "Add 'cs' for the C# version. Example Usage:  '/vec3 cs'", {
	{
		name = "args",
		help = "cs, json"
	}
})
TriggerEvent('chat:addSuggestion', '/vec4', "Add 'cs' for the C# version. Example Usage:  '/vec4 cs'", {
	{
		name = "args",
		help = "cs, json"
	}
})

if Config.EnableKeyMappings == true then
    RegisterKeyMapping("vec2", "Add 'cs' for the C# version. Example Usage:  '/vec2 cs'", "keyboard", Config.DefaultKeyMappings["vec2"] or "L")
    RegisterKeyMapping("vec3", "Add 'cs' for the C# version. Example Usage:  '/vec3 cs'", "keyboard", Config.DefaultKeyMappings["vec3"] or "K")
    RegisterKeyMapping("vec4", "Add 'cs' for the C# version. Example Usage:  '/vec4 cs'", "keyboard", Config.DefaultKeyMappings["vec4"] or "J")

    if Config.DefaultKeyMappings["vec2 cs"] ~= "" then
        RegisterKeyMapping("vec2 cs", "", "keyboard", Config.DefaultKeyMappings["vec2 cs"])
    end
    if Config.DefaultKeyMappings["vec3 cs"] ~= "" then
        RegisterKeyMapping("vec3 cs", "", "keyboard", Config.DefaultKeyMappings["vec3 cs"])
    end
    if Config.DefaultKeyMappings["vec4 cs"] ~= "" then
        RegisterKeyMapping("vec4 cs", "", "keyboard", Config.DefaultKeyMappings["vec4 cs"])
    end
end