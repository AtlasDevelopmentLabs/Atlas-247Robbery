--------------- 
-- Locals (my favourite 😀)
---------------
gb_coolDown = 0
local shops = config.shopcoords
local CachedShops = {}
for i = 1, #shops do
    table.insert(CachedShops, {
        name = shops[i].name,
        x = shops[i].x,
        y = shops[i].y,
        z = shops[i].z,
        distance = shops[i].distance
    })
end


--------------- 
-- Main Code (need to optimize 🤓☝️)
---------------

local function showRobberyPrompt(shopName)
    lib.showTextUI('[E] - Rob ' .. shopName)
end

local function performRobbery(shopName)
    local _ped = PlayerPedId()

    if lib.progressBar({
        duration = 2000,
        label = 'Cleaning Safe Numpad...',
        useWhileDead = false,
        canCancel = true,
        anim = {
            dict = 'amb@prop_human_bum_bin@base',
            clip = 'amb@prop_human_bum_bin@base'
        },
    }) then
        loadAnimDict("amb@prop_human_bum_bin@base")
        TaskPlayAnim(_ped, 'amb@prop_human_bum_bin@base', 'base', 8.0, 1.0, -1, 1, 0, false, false, false)

        if lib.skillCheck({'easy', 'easy', {areaSize = 50, speedMultiplier = 1.25}, 'easy'}, {'w', 'a', 's', 'd'}) then
            gb_coolDown = config.Cooldown
            ClearPedTasks(_ped)
            lib.notify({
                title = 'Robbery',
                position = 'center-right',
                description = 'Silent Alarm Has Been Triggered',
                type = 'success'
            })
            local closestShop = getClosestCachedShop()
            local closestShopMessage = closestShop.name
            local alarmMessage = 'Silent Alarm Triggered: '.. closestShop.name
            TriggerServerEvent('Atlas:Robbery:SilentAlarm', alarmMessage)
            TriggerServerEvent('Atlas:Robbery:DiscordLog', closestShopMessage)
            -- Someone Create a Pull Request for alarm sound (use xSound)
        else
            ClearPedTasks(_ped)
            lib.notify({
                title = 'Robbery',
                position = 'center-right',
                description = 'You Have Failed the Robbery at ' .. shopName,
                type = 'error'
            })
        end
    else
        ClearPedTasks(_ped)
        lib.notify({
            title = 'Robbery',
            position = 'center-right',
            description = 'You Have Cancelled The Robbery',
            type = 'error'
        })
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local closestShop = getClosestCachedShop()
        
        if closestShop and closestShop.distance <= getClosestCachedShopDistance() and gb_coolDown <= 0 then
            if gb_coolDown == 0 then
                showRobberyPrompt(closestShop.name)
            end
            if IsControlJustPressed(0, 38) then
                performRobbery(closestShop.name)
            end
        else
            lib.hideTextUI()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if gb_coolDown > 0 then
            gb_coolDown = gb_coolDown - 1
        end
    end
end)

--------------- 
-- Functions (need to optimize 🤓☝️)
---------------

function ranNum(min, max)
    return math.random(min, max)
end

function getClosestCachedShopName()
    return getClosestCachedShop().name
end

function getClosestCachedShopDistance()
    return getClosestCachedShop().distance
end

function getClosestCachedShopAlarm()
    return getClosestCachedShop().alarm
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function getClosestCachedShop()
    local closestShop = nil
    local minDistance = math.huge 
    for i = 1, #CachedShops do
        local playerX, playerY, playerZ = table.unpack(GetEntityCoords(PlayerPedId()))
        local distance = GetDistanceBetweenCoords(playerX, playerY, playerZ, CachedShops[i].x, CachedShops[i].y, CachedShops[i].z, true)
        
        if distance < CachedShops[i].distance and distance < minDistance then
            closestShop = CachedShops[i]
            minDistance = distance
        end
    end

    return closestShop
end