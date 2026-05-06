fx_version 'adamant'

game 'gta5'

-- Resource Metadata
author 'EddiesLife247'
description 'Wandering Trader buys and sells items at different locations'
version '1.0.0'
lua54 'yes' -- This ensures the asset is compatible with Lua 5.4


version '0.1.0'


client_scripts {
    'client.lua',
}
server_scripts {
    'server.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
}

escrow_ignore {
    'config.lua',              -- Ignoring the main configuration file
}


dependency 'qb-core'
dependency 'ox_lib'
dependency 'ox_inventory'