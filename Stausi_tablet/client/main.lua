local open = false

RegisterKeyMapping("+tablet", "Tilgå Database", 'keyboard', Config.hotkey)
RegisterCommand(Config.command, function()
    TriggerServerEvent("tablet_tablet:CheckJob")
end, false)
function OpenUI()
    print("Client openUi function called")

    ExecuteCommand("e tablet2")
    -- TriggerServerEvent("JERESEVENT")

    SendNUIMessage({
        action = "open"
    })

    SetNuiFocus(true, true)
    open = true
end

RegisterNUICallback('escape', function(data, cb)
    ExecuteCommand('e stop')

    SetNuiFocus(false, false)
    open = false
    SendNUIMessage({
        action = "close"
    })
    cb('ok')
end)

RegisterNetEvent('tablet_tablet:OpenTablet')
AddEventHandler('tablet_tablet:OpenTablet', function()
    OpenUI()
end)