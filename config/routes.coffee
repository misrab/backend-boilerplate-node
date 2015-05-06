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
	# hook up to all routes
	# app.use auth

	# basic route
	app.get '/api/v1', (req, res)->
  		res.json 200


	# users


	# products



	# social / login

	app.post 'api/v1/user/login', (req, res)->
		user = req.body
		console.log "user is " + JSON.stringify user
		res.json 200
		

	# expect a user post
	app.post '/api/v1/user/socialLogin', (req, res)->
		user = req.body
		console.log "user is " + JSON.stringify user
		res.json 200




	# 404
	app.use (req, res, next)->
		return res.json 404, null


	