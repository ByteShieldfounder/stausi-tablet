fx_version 'adamant'

game 'gta5'

ui_page 'html/index.html'


client_scripts {
	'client/main.lua',
    "lib/Proxy.lua",
    "lib/Tunnel.lua"
}
shared_script 'config.lua'

server_scripts {
	"@vrp/lib/utils.lua",
	'server.lua'
}

files {
    'html/index.html',
	'html/css/bootstrap.min.css',
	'html/css/style.css',
	'html/js/jquery.min.js',
    'html/js/listen.js',
	"img/*.png"
}