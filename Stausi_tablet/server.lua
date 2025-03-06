local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterNetEvent('tablet_tablet:CheckJob')
AddEventHandler('tablet_tablet:CheckJob', function()
        print("Server CheckJob called")
        for job = 1, #Config.jobs do
            if Config.framework == "vrp" then
                print("Server framework er vrp")
                print(vRP.getUserId({source}))
                print(Config.jobs[job])
                if not vRP.hasGroup({vRP.getUserId({source}), Config.jobs[job]}) then
                    print("Server OpenTablet triggered fordi han har ranken")
                    TriggerClientEvent("tablet_tablet:OpenTablet", source)
                else 
                    print("du har ik adgang til dette")
                    return false
                end 
            elseif string.lower(Config.framework) == "esx" then
                if ESX.GetPlayerFromId(source).getJob().name == Config.jobs[job] then 
                    print("Server OpenTablet triggered fordi han har ranken")
                    TriggerClientEvent("tablet_tablet:OpenTablet", source)
                else
                    print("du har ik adgang til dette")
                    return false
                end
            elseif string.lower(Config.framework) == "qbcore" then
                if QBCore.Functions.GetPlayerData().job.name == Config.jobs[job] then
                    print("Server OpenTablet triggered fordi han har ranken")
                    TriggerClientEvent("tablet_tablet:OpenTablet", source)
                else
                    print("du har ik adgang til dette")
                    return false
                end
            else
                print("Framework ukendt")
                return false
            end
        end
end)