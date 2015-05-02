url = require 'url'


AUTH_TOKEN = 'fdsjfk32r90r32orjf3902j3j3felkfds'


module.exports = (app)->
	# auth middleware
	auth = (req, res, next)->
		console.log 'AUTHENTICATING'
		# get auth header
		# auth is in base64(username:password) so we need to decode the base64
		# auth = req.headers.authorization
		# if !auth then return res.send 401
		# tmp = auth.split(' ')
		# buf = new Buffer(tmp[1], 'base64')
		# plain_auth = buf.toString()
		# creds = plain_auth.split(':')
		# username = creds[0]
		# password = creds[1]
		url_parts = url.parse(req.url, true)
		query = url_parts.query
		if query['secret'] != AUTH_TOKEN then return res.json 401, null
		console.log 'PASSED AUTH'
		next()
	app.use auth

	# basic route
	app.get('/api/v1', (request, response)->
  		response.json 200
	)


	# users


	# products



	