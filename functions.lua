function sendHttpRequest(url, data)
    PerformHttpRequest(url, function(err, text, headers)
        if err then
            return
        end
    end, 'POST', json.encode(data), { ['Content-Type'] = 'application/json' })
end

-- function SendNoti(recipient, message, type)
--     if config.Notify == 0 then 
--         if type == "success" then 
--             local type = "SYSTEM"
--             local message = "~g~[" .. type .. "] ~w~" .. message
--             TriggerClientEvent('chat:addMessage', -1, {
--                 template = '<div class="chat-message ooc"><b><span style="color: #7d7d7d">{1}: </span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"></div></div>',
--                 args = { recipient, message }
--             })
--         elseif type == "error" then 
--             local type = "SYSTEM"
--             local message = "~r~[" .. type .. "] ~w~" .. message
--             TriggerClientEvent('chat:addMessage', -1, {
--                 template = '<div class="chat-message ooc"><b><span style="color: #7d7d7d">{1}: </span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"></div></div>',
--                 args = { recipient, message }
--             })
--         end
--     elseif config.Notify == 1 then 
--         if type == "success" then 
--             TriggerClientEvent('okokNotify:Alert', recipient, 'SUCCESS', message, config.NotifyDuration, 'success', true)
--         elseif type == "error" then 
--             TriggerClientEvent('okokNotify:Alert', recipient, 'ERROR', message, config.NotifyDuration, 'error', true)
--         end
--     elseif config.Notify == 2 then 
--         if type == "success" then 
--             TriggerClientEvent('codem-notification', recipient, message, config.NotifyDuration, 'check', options)
--         elseif type == "error" then 
--             TriggerClientEvent('codem-notification', recipient, message, config.NotifyDuration, 'error', options)
--         end
--     elseif config.Notify == 3 then 
--         if type == "success" then 
--             TriggerClientEvent('mythic_notify:client:SendAlert', recipient, { type = 'success', text = message, style = { ['background-color'] = '#000000', ['color'] = '#ffff' } })
--         elseif type == "error" then 
--             TriggerClientEvent('mythic_notify:client:SendAlert', recipient, { type = 'error', text = message, style = { ['background-color'] = '#000000', ['color'] = '#ffff' } })
--         end
--     elseif config.Notify == 4 then 
--         if type == "success" then 
--         TriggerClientEvent('ox_lib:notify', -1, {
--             title = 'Atlas DevLabs System',
--             description = message,
--             type = 'success',
--             position = 'center-right'
--         })
--         elseif type == "error" then 
--             TriggerClientEvent('ox_lib:notify', source, {
--                 title = 'Atlas DevLabs System',
--                 description = 'You must provide a message to announce automatically.',
--                 type = 'error',
--                 position = 'center-right'
--             })
--         end
--     end
-- end

----- WILL BE ADDING MULTI NOTIFICATIONS NEXT UPDATE ^^^^^^