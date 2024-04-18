ESX = exports["es_extended"]:getSharedObject()
local cooldown = false

-- Item Handler
RegisterNetEvent("bigsea-airdrop:server:ItemHandler")
AddEventHandler("bigsea-airdrop:server:ItemHandler", function(kind, item, amount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if kind == 'add' then
        xPlayer.addInventoryItem(item, amount)
        TriggerClientEvent('esx:showNotification', src, 'Received ' .. amount .. 'x ' .. item)
    elseif kind == 'remove' then
        xPlayer.removeInventoryItem(item, amount)
        TriggerClientEvent('esx:showNotification', src, 'Lost ' .. amount .. 'x ' .. item)
    end    
end)

-- Cooldown check
RegisterNetEvent('bigsea-airdrop:server:cooldown')
AddEventHandler('bigsea-airdrop:server:cooldown', function(cb)
    if cooldown then
        cb(true)
    else
        cb(false)
    end
end)

-- Start cooldown
RegisterNetEvent('bigsea-airdrop:server:startCooldown')
AddEventHandler('bigsea-airdrop:server:startCooldown', function()
    if not cooldown then
        cooldown = true 
        local timer = Config.Cooldown * 60000
        print("Airdrop: Cooldown started")
        Citizen.CreateThread(function()
            while timer > 0 do
                Wait(1000)
                timer = timer - 1000
                if timer <= 0 then
                    TriggerClientEvent('bigsea-airdrop:crate:clearcrate', -1)
                    print('Airdrop: Cooldown finished')
                    cooldown = false 
                end 
            end
        end)
    end
end)

-- Delete crate
RegisterNetEvent('bigsea-airdrop:crate:deleteCrate')
AddEventHandler('bigsea-airdrop:crate:deleteCrate', function(netId)
    local crate = NetworkGetEntityFromNetworkId(netId)
    if DoesEntityExist(crate) then
        DeleteEntity(crate)
        TriggerClientEvent('bigsea-airdrop:crate:destroyzone', -1)
    end
end)

-- Set polygon
RegisterNetEvent('dropCoords:server:setPoly')
AddEventHandler('dropCoords:server:setPoly', function(dropCoords)
    TriggerClientEvent('dropCoords:client:setPoly', -1, dropCoords)
end)

-- Spawn crate
RegisterNetEvent("bigsea-airdrop:crate:spawnCrate")
AddEventHandler("bigsea-airdrop:crate:spawnCrate", function(crateSpawn, item, amount)
    local netId = nil
    local crate = CreateObject(GetHashKey(Config.CrateModel), crateSpawn, true, true, true)
    while not DoesEntityExist(crate) do
        Wait(25)
    end
    netId = NetworkGetNetworkIdFromEntity(crate)
    TriggerClientEvent("bigsea-airdrop:crate:applyNatives", -1, netId) 
    SetTimeout(3000, function()
        TriggerClientEvent("bigsea-airdrop:crate:createOxTarget", -1, netId, crate, item, amount)
    end)
end)

-- Get amount of cops online and on duty
ESX.RegisterServerCallback('bigsea-airdrop:server:getCops', function(source, cb)
    local copsOnline = 0
    for _, job in pairs(Config.PoliceJobs) do
        local players = ESX.GetPlayers()
        for _, playerId in ipairs(players) do
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer.job.name == job then
                copsOnline = copsOnline + 1
            end
        end
    end
    Wait(100)
    cb(copsOnline)
end)

-- Golden Satellite Phone
ESX.RegisterUsableItem('goldenphone', function(source)
    local src = source    
    TriggerClientEvent("bigsea-airdrop:client:CreateDrop", src, 'goldenphone', true, 400)            
end)

-- Red Satellite Phone
ESX.RegisterUsableItem('redphone', function(source)
    local src = source    
    TriggerClientEvent("bigsea-airdrop:client:CreateDrop", src, 'redphone', true, 400)            
end)

-- Green Satellite Phone
ESX.RegisterUsableItem('greenphone', function(source)
    local src = source    
    TriggerClientEvent("bigsea-airdrop:client:CreateDrop", src, 'greenphone', true, 400)            
end)
