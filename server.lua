local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("wanderingTrader:buyItem", function(data)
    local src = source
    local itemName = data.name
    local itemPrice = data.price
    local quantity = tonumber(data.quantity) or 1
    local currencyItem = Config.CurrencyType or "money" -- Use money as an item

    if quantity < 1 then
        if Config.Debug then print("^1[Wandering Trader] ERROR: Invalid quantity for purchase.^7") end
        return
    end

    -- Validate price
    local validPrice = false
    for _, item in pairs(Config.ItemsForSale) do
        if item.name == itemName and itemPrice >= item.minPrice and itemPrice <= item.maxPrice then
            validPrice = true
            break
        end
    end

    if not validPrice then
        if Config.Debug then print("^1[Wandering Trader] ERROR: Invalid price received for " .. itemName .. "^7") end
        return
    end

    local totalPrice = itemPrice * quantity

    if Config.Debug then print("^2[Wandering Trader] Processing buy request: " .. quantity .. "x " .. itemName .. " at $" .. totalPrice .. " using " .. currencyItem .. "^7") end

    -- Check if the player has enough money
    local playerMoney = exports.ox_inventory:GetItemCount(src, currencyItem)

    if playerMoney >= totalPrice then
        exports.ox_inventory:RemoveItem(src, currencyItem, totalPrice) -- Deduct total price
        exports.ox_inventory:AddItem(src, itemName, quantity) -- Give the item(s)

        if Config.Debug then print("^2[Wandering Trader] Purchase successful: " .. quantity .. "x " .. itemName .. " | $" .. totalPrice .. "^7") end
        TriggerClientEvent('QBCore:Notify', src, "You bought " .. quantity .. "x " .. itemName .. " for $" .. totalPrice, "success")
    else
        if Config.Debug then print("^1[Wandering Trader] Purchase failed: Not enough money.^7") end
        TriggerClientEvent('QBCore:Notify', src, "Not enough money!", "error")
    end
end)

RegisterNetEvent("wanderingTrader:sellItem", function(data)
    local src = source
    local itemName = data.name
    local itemPrice = data.price
    local quantity = tonumber(data.quantity) or 1
    local currencyItem = Config.CurrencyType or "money" -- Use money as an item

    if quantity < 1 then
        if Config.Debug then print("^1[Wandering Trader] ERROR: Invalid quantity for selling.^7") end
        return
    end

    -- Validate price
    local validPrice = false
    for _, item in pairs(Config.ItemsToBuy) do
        if item.name == itemName and itemPrice >= item.minPrice and itemPrice <= item.maxPrice then
            validPrice = true
            break
        end
    end

    if not validPrice then
        if Config.Debug then print("^1[Wandering Trader] ERROR: Invalid sell price received for " .. itemName .. "^7") end
        return
    end

    local totalPrice = itemPrice * quantity

    if Config.Debug then print("^2[Wandering Trader] Processing sell request: " .. quantity .. "x " .. itemName .. " for $" .. totalPrice .. " using " .. currencyItem .. "^7") end

    -- Check if the player has enough of the item before selling
    local hasItem = exports.ox_inventory:GetItemCount(src, itemName)

    if hasItem and hasItem >= quantity then
        exports.ox_inventory:RemoveItem(src, itemName, quantity) -- Remove the items
        exports.ox_inventory:AddItem(src, currencyItem, totalPrice) -- Give money as an item

        if Config.Debug then print("^2[Wandering Trader] Sale successful: " .. quantity .. "x " .. itemName .. " | $" .. totalPrice .. "^7") end
        TriggerClientEvent('QBCore:Notify', src, "You sold " .. quantity .. "x " .. itemName .. " for $" .. totalPrice, "success")
    else
        if Config.Debug then print("^1[Wandering Trader] Sale failed: Player does not have enough items.^7") end
        TriggerClientEvent('QBCore:Notify', src, "You don't have enough of that item!", "error")
    end
end)

-- Print a message to the server console when the script is loaded
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("^2[WanderingTrader]^0 Server-side script loaded, developed by EddiesLife247 Scripts. Support at: https://discord.eddieslife247.co.uk/")

        -- Check for updates asynchronously
        PerformHttpRequest("https://eddieslife247.co.uk/WanderingTrader/version.txt", function(statusCode, response, headers)
            if statusCode == 200 and response then
                local currentVersion = GetResourceMetadata(GetCurrentResourceName(), "version", 0)
                local remoteVersion = response:match("%S+") -- Extract the version string

                if remoteVersion and currentVersion ~= remoteVersion then
                    print("^3[WanderingTrader]^0 A New Update is available on the keymaster site! Version: " .. remoteVersion)
                else
                    print("^2[WanderingTrader]^0 You are using the latest version.")
                end
            else
                print("^1[WanderingTrader]^0 Failed to check for updates. Status Code: " .. tostring(statusCode))
            end
        end, "GET", "", {['Content-Type'] = 'text/plain'})
    end
end)
