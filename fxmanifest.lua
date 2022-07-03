fx_version 'cerulean'

author 'waddle_dee'
description 'Player management stuff'
repository 'https://github.com/waddle1010/wd-hospital'
version '0.0.8'

lua54 'yes'

games {
	'gta5',
}

dependencies {
	'/server:5181',
	'/onesync',
}

shared_script '@ox_lib/init.lua'

shared_scripts {
	'public/init.lua',
}

client_scripts {
	'public/utils/*.lua',
	'public/client/*.lua',
}

server_scripts {
	'public/server/*.lua',
}

files {
	'config.json',
	'locales/*.json',
}
