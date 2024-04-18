fx_version 'cerulean'
games { 'gta5' }

author 'BigSea 制作'
description 'ESX的物品空投系统'
version '1.0'

shared_scripts {
    "config.lua",
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',    
    "client/cl_main.lua"
}

server_scripts {    
    "server/sv_main.lua"
}
shared_script '@es_extended/imports.lua'

lua54 'yes'