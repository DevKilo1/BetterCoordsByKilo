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
    else
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '' .. vec(coords.x, coords.y)
        })
        ShowNotificationTicker('Copied to clipboard! ' .. vec(coords.x, coords.y))
    end
    
end,true)

RegisterCommand('vec3', function(source, args)
    if args[1] == 'cs' then
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = 'new Vector3(' .. coords.x.. 'f, '.. coords.y..'f, '..coords.z..'f)'
        })
        ShowNotificationTicker('Copied to clipboard! ' .. 'new Vector3(' .. coords.x.. 'f, '.. coords.y..'f, '..coords.z..'f)')    
    else
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '' .. vec(coords.x, coords.y,coords.z)
        })
        ShowNotificationTicker('Copied to clipboard! ' .. vec(coords.x, coords.y,coords.z))    
    end
    
end,true)

RegisterCommand('vec4', function(source, args)
    if args[1] == 'cs' then
        local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = 'new Vector4(' .. coords.x.. 'f, '.. coords.y..'f, '..coords.z..'f, '..heading..'f)'
        })
        ShowNotificationTicker('Copied to clipboard! ' .. 'new Vector4(' .. coords.x.. 'f, '.. coords.y..'f, '..coords.z..'f, '..heading..'f)')
    else
        local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
        SendNUIMessage({
            type = 'clipboard',
            data = '' .. vec(coords.x, coords.y,coords.z,heading)
        })
        ShowNotificationTicker('Copied to clipboard! ' .. vec(coords.x, coords.y,coords.z,heading))
    end

end,true)

TriggerEvent('chat:addSuggestion', '/vec2', "Add 'cs' for the C# version. Example Usage:  '/vec2 cs'", {
	{
		name = "args",
		help = "cs"
	}
})
TriggerEvent('chat:addSuggestion', '/vec3', "Add 'cs' for the C# version. Example Usage:  '/vec3 cs'", {
	{
		name = "args",
		help = "cs"
	}
})
TriggerEvent('chat:addSuggestion', '/vec4', "Add 'cs' for the C# version. Example Usage:  '/vec4 cs'", {
	{
		name = "args",
		help = "cs"
	}
})

if Config.EnableKeyMappings then
    RegisterKeyMapping("vec2", "Add 'cs' for the C# version. Example Usage:  '/vec2 cs'", "keyboard", Config.DefaultKeyMappings["vec2"] or "L")
    RegisterKeyMapping("vec3", "Add 'cs' for the C# version. Example Usage:  '/vec3 cs'", "keyboard", Config.DefaultKeyMappings["vec3"] or "K")
    RegisterKeyMapping("vec4", "Add 'cs' for the C# version. Example Usage:  '/vec4 cs'", "keyboard", Config.DefaultKeyMappings["vec4"] or "J")
end