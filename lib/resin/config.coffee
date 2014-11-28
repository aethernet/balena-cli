_ = require('lodash')
url = require('url')
path = require('path')

config =

	# TODO: Should be configurable
	remoteUrl: 'https://staging.resin.io'
	apiPrefix: '/ewa/'

	# TODO: Check if not running on UNIX environment
	# and add a custom path accordingly
	dataPrefix: path.join(process.env.HOME, '.resin')
	sshKeyWidth: 43

config.pluginsDirectory = path.join(config.dataPrefix, 'plugins')

config.urls =
	signup: '/signup'
	preferences: '/preferences'
	keys: '/user/keys'
	identify: '/blink'

# Append config.remoteUrl before every url
config.urls = _.object _.map config.urls, (value, key, object) ->
	return [ key, url.resolve(config.remoteUrl, value) ]

module.exports = config
