Config = {}

Config.Debug = false

-- 21 random trader locations (vector4 format)
Config.TraderLocations = {
    --vector4(180.25, 308.66, 105.37, 170.84), -- City - Clinton Ave
    --vector4(1111.33, -340.44, 67.15, 335.7), -- City - West Mirror Drive
    vector4(-1164.51, -506.35, 44.03, 137.65), -- City - Marathon Ave
    --vector4(765.76, -1043.62, 20.81, 57.91), -- City - Popular Street 
    --vector4(1125.26, -1010.57, 44.67, 105.12), -- City - El Rancho
    --vector4(1139.75, -428.21, 67.3, 246.06), -- City - Mirror Park Blvd
    --vector4(-38.74, -78.27, 58.63, 280.61), -- City - Las Lagunas
    --vector4(-1317.6, -255.0, 41.87, 34.2), -- City - Parkers Parking
	vector4(-171.76, -980.41, 270.19, 338.45), -- City - MHC Roof
    vector4(1988.66, 3787.86, 32.18, 29.35), -- Sandy Shores - Sandys
    --vector4(-84.0, 6388.73, 31.49, 327.86), -- Paleto Bay - Near Dream View Motel
    vector4(170.85, 6652.77, 31.42, 107.63), -- Paleto Bay - Behind Don's Country Store
    --vector4(154.95, -252.47, 51.4, 216.2), -- City - Behind white widow
    vector4(484.21, -90.1, 66.45, 249.31), -- City - Opposite auto exotic
    --vector4(359.57, -34.29, 100.62, 213.49), -- City - Power Street roof hidey hole
    --vector4(111.13, -887.78, 31.12, 223.15), -- City - Escapism Travel near Legion
    vector4(271.39, -992.85, 29.33, 159.29), -- City - Near MRPS
    --vector4(7.07, -714.56, 32.48, 14.92), -- City - UD Dumpsters
    --vector4(-122.07, -1292.62, 47.9, 46.61), -- City - Power Street Auto Parts Hidey Hole
    --vector4(387.83, -1685.0, 48.3, 52.09), -- City - Roy Lowerstein Parking Garage
    --vector4(446.29, -1550.88, 29.28, 204.05), -- City - Davis Ave
    --vector4(46.54, -460.2, 107.86, 81.45), -- City - Top of Power Street Crane
    --vector4(-187.6, -1042.67, 21.62, 64.06), -- City - Loading dock MHC
	--vector4(-1634.53, 6475.62, 16.94, 242.3),  -- Roxwood - Powerplant
	--vector4(-2746.53, 8041.11, 50.66, 188.19), -- Roxwood - Raceway
	--vector4(-1835.29, 7798.67, 133.6, 283.84), -- Roxwood - Wedding Venue
	vector4(-476.98, 7675.23, 6.23, 288.0), -- Roxwood - Scrapyard
	vector4(-533.97, 7178.71, 35.78, 89.27) -- Roxwood - Posh Yellow House
}

-- Currency type ("cash" or "black_money")
Config.CurrencyType = "black_money"

-- Items the trader sells (name, price)
Config.ItemsForSale = {
    { name = "WEAPON_CROWBAR", minPrice = 1250, maxPrice = 7500 },
    { name = "hacking_device", minPrice = 1250, maxPrice = 7500 },
    { name = "gatecrack", minPrice = 1250, maxPrice = 7500 },
    { name = "rope", minPrice = 1250, maxPrice = 7500 },
    { name = "thermite", minPrice = 1250, maxPrice = 5000 },
    { name = "repairkit", minPrice = 1250, maxPrice = 5000 },
    { name = "knife", minPrice = 1250, maxPrice = 7000 },
    { name = "power_saw", minPrice = 1250, maxPrice = 7500 },
    { name = "fence_cutters", minPrice = 1250, maxPrice = 7500 },
    { name = "security_card_01", minPrice = 1250, maxPrice = 7500 },
    { name = "security_card_02", minPrice = 1250, maxPrice = 7500 },
    { name = "advancedlockpick", minPrice = 1250, maxPrice = 7500 },
    { name = "ls_vehicle_finder", minPrice = 1250, maxPrice = 7500 },
    { name = "gunpowder", minPrice = 1250, maxPrice = 7500 },
    { name = "paper", minPrice = 1250, maxPrice = 7500 },
    { name = "pistol_blueprint", minPrice = 1250, maxPrice = 7500 },
    { name = "gunpowder", minPrice = 1250, maxPrice = 7500 },
    { name = "ammo_blueprint", minPrice = 1250, maxPrice = 7500 },
    { name = "smg_blueprint", minPrice = 1250, maxPrice = 7500 },

}

-- Items the trader buys (name, minPrice, maxPrice)
Config.ItemsToBuy = {
    { name = "goldbar", minPrice = 20, maxPrice = 250 },
    { name = "diamond", minPrice = 20, maxPrice = 250 },
    { name = "rolex", minPrice = 20, maxPrice = 250 },
    { name = "diamond_ring", minPrice = 20, maxPrice = 250 },
    { name = "goldchain", minPrice = 70, maxPrice = 250 },
    { name = "vehiclekeys", minPrice = 1, maxPrice = 150 },
    { name = "rubyring", minPrice = 70, maxPrice = 250 },
    { name = "goldbracelet", minPrice = 70, maxPrice = 250 },
    { name = "golddiamondring", minPrice = 70, maxPrice = 250 },
    { name = "silverchain", minPrice = 70, maxPrice = 250 },
    { name = "diamond_necklace", minPrice = 70, maxPrice = 250 },
    { name = "sapphire_necklace", minPrice = 70, maxPrice = 250 },
    { name = "ruby_necklace", minPrice = 70, maxPrice = 250 },
    { name = "diamond_ring", minPrice = 70, maxPrice = 250 },
    { name = "gold_ring", minPrice = 70, maxPrice = 250 },
    { name = "ruby_ring", minPrice = 70, maxPrice = 250 },
    { name = "1797coin", minPrice = 70, maxPrice = 250 },
    { name = "1792coin", minPrice = 70, maxPrice = 250 },
}
