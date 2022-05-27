fx_version 'cerulean'

description 'Got bored so why not?'
author 'waddle_dee'
version '0.0.3'
repository 'https://github.com/waddle1010/wd-hospital'

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
	'@es_extended/imports.lua',
	'src/init.lua',
}

client_scripts {
	'src/utils/*.lua',
	'src/client/*.lua',
}

server_scripts {
	'src/server/*.lua',
}

files {
	'config.json',
	'locales/*.json',
}
