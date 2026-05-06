local QBCore = exports['qb-core']:GetCoreObject()
local traderPed = nil
local selectedLocation = nil

Citizen.CreateThread(function()
    if Config.Debug then print("^2[Wandering Trader] Script started...^7") end
    math.randomseed(GetGameTimer() + math.floor(GetCloudTimeAsInt()))
    selectedLocation = Config.TraderLocations[math.random(#Config.TraderLocations)]
    
    if Config.Debug then print("^3[Wandering Trader] Selected trader location: ^7", selectedLocation) end
    spawnTrader(selectedLocation)
end)

function spawnTrader(location)
    if Config.Debug then print("^3[Wandering Trader] Spawning trader at: ^7", location) end

    if DoesEntityExist(traderPed) then
        DeletePed(traderPed)
    end

    local model = GetHashKey("a_m_m_tramp_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end

    traderPed = CreatePed(4, model, location.x, location.y, location.z - 1.0, location.w, false, true)
    SetEntityInvincible(traderPed, true)
    FreezeEntityPosition(traderPed, true)
    SetBlockingOfNonTemporaryEvents(traderPed, true)

    if Config.Debug then print("^2[Wandering Trader] Trader spawned successfully!^7") end

    exports.ox_target:addLocalEntity(traderPed, {
        {
            label = "Buy Items",
            icon = "fa-solid fa-shopping-cart",
            event = "wanderingTrader:buyMenu"
        },
        {
            label = "Sell Items",
            icon = "fa-solid fa-handshake",
            event = "wanderingTrader:sellMenu"
        }
    })
end

-- Open buy menu
RegisterNetEvent("wanderingTrader:buyMenu", function()
    local options = {}
    for _, item in pairs(Config.ItemsForSale) do
        local randomPrice = math.random(item.minPrice, item.maxPrice)
        table.insert(options, {
            title = item.name,
            description = "Price: " .. randomPrice .. " " .. Config.CurrencyType,
            event = "wanderingTrader:selectBuyQuantity",
            args = { name = item.name, price = randomPrice }
        })
    end
    lib.registerContext({
        id = "trader_buy_menu",
        title = "Wandering Trader - Buy",
        options = options
    })
    lib.showContext("trader_buy_menu")
end)

-- Select buy quantity
RegisterNetEvent("wanderingTrader:selectBuyQuantity", function(data)
    local input = lib.inputDialog("Select Quantity", {"Quantity"})
    if input and tonumber(input[1]) then
        local quantity = tonumber(input[1])
        TriggerServerEvent("wanderingTrader:buyItem", { name = data.name, price = data.price, quantity = quantity })
    end
end)

-- Open sell menu
RegisterNetEvent("wanderingTrader:sellMenu", function()
    local options = {}
    for _, item in pairs(Config.ItemsToBuy) do
        local randomPrice = math.random(item.minPrice, item.maxPrice)
        table.insert(options, {
            title = item.name,
            description = "Sell Price: " .. randomPrice .. " " .. Config.CurrencyType,
            event = "wanderingTrader:selectSellQuantity",
            args = { name = item.name, price = randomPrice }
        })
    end
    lib.registerContext({
        id = "trader_sell_menu",
        title = "Wandering Trader - Sell",
        options = options
    })
    lib.showContext("trader_sell_menu")
end)

-- Select sell quantity
RegisterNetEvent("wanderingTrader:selectSellQuantity", function(data)
    local input = lib.inputDialog("Select Quantity", {"Quantity"})
    if input and tonumber(input[1]) then
        local quantity = tonumber(input[1])
        TriggerServerEvent("wanderingTrader:sellItem", { name = data.name, price = data.price, quantity = quantity })
    end
end)

CreateThread(function()
    print("^2[WanderingTrader]^0 Client-side script loaded, developed by EddiesLife247 Scripts. Support at: https://discord.eddieslife247.co.uk/")
end)
