RegisterNetEvent('Atlas:Robbery:SilentAlarm')
AddEventHandler('Atlas:Robbery:SilentAlarm', function(alarmMessage)
    local message = alarmMessage
    local Players = GetPlayers()
    for _, player in pairs(Players) do
        if IsPlayerAceAllowed(player, config.AcePerm) then
            TriggerClientEvent('ox_lib:notify', player, {
                title = 'Silent Alarm', 
                description = message,
                duration = 18000,
                position = 'center-right',
                type = 'info'
            })
        end
    end
end)

RegisterNetEvent('Atlas:Robbery:DiscordLog')
AddEventHandler('Atlas:Robbery:DiscordLog', function(closestShopMessage)
    local discordId
    for _, identifier in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(identifier, 1, string.len("discord:")) == "discord:" then
            discordId = string.gsub(identifier, "discord:", "")
        end
    end
    if discordId then
        local webhookURL = config.webhookURL
        local shop = closestShopMessage
        local embedData = {
            ["color"] = 5763719, 
            ["title"] = "24/7 Status: Robbery Started",
            ["description"] = "**Player Name**: " .. GetPlayerName(source).. "\n \n**Discord Tag**: <@" .. discordId .. "> \n \n**Discord UID**: " ..discordId .. "\n \n**Location** ".. shop,
            ["footer"] = {
                ["text"] = "Atlas Dev Labs - 2024",
            },
        }
        sendHttpRequest(webhookURL, {username = username, embeds = {embedData}})
    end
end)