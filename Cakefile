fs = require 'fs'
{exec} = require 'child_process'

ansi =
	red  			: '\x1B[31m'
	green 			: '\x1B[36m'
	yellow 			: '\x1B[33m'
	blue  			: '\x1B[34m'
	dark_grey  		: '\x1B[1;30m'
	light_grey  	: '\x1B[1;32m'
	reset   		: '\x1B[0m'

log = (message, color) ->
	console.log ansi[color] + message + ansi.reset

option '-m', '--message [COMMIT_MESSAGE]', 'set git commit message'

task 'build', 'build from src files', (options) ->
	invoke 'build:coffee'

task 'build:coffee', 'build /lib from /src', (options) ->
	exec 'coffee -c -o lib src', (err, stdout, stderr) ->
		err && throw err
		log 'Build Coffee OK!', 'green'	
