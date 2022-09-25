local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-forgery:server:ForgeID", function(citizenid, firstname, lastname, birthday, nationality)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.Cost then
        info = {}
        info.citizenid = citizenid
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = nationality

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["id_card"], 'add')
        Player.Functions.AddItem("id_card", 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.Cost)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)

RegisterServerEvent("qb-forgery:server:ForgeDrivers", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.Cost then
        info = {}
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.type = "CLASS G DRIVER LICENSE"

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["driver_license"], 'add')
        Player.Functions.AddItem("driver_license", 1, nil, info)

        Player.Functions.RemoveMoney("cash", Config.Cost)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
    end
end)