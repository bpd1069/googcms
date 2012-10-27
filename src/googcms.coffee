yaml = require 'js-yaml'
fs = require 'fs'
csv = require 'csv'
{exec} = require 'child_process'

exports.run = ->
	config = yaml.load fs.readFileSync '.googcms.yml'
	obj = {}
	exec 'google docs get ' + config.document + ' strings.csv', (err, stdout, stderr) ->
		err && throw err
		console.log stdout
		csv().from('strings.csv')
			.on 'record', (d, i) ->
				unless i is 0 or d[0] is ''
					obj[d[config.column_key]] = d[config.column_value]
			.on 'end', ->
				fs.writeFile 'strings.json', JSON.stringify(obj), (err) ->
					err && throw err
					console.log 'JSON saved'
					fs.unlink 'strings.csv', (err) ->
						err && throw err
