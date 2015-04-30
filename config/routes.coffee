module.exports = (app)->
	app.get('/', (request, response)->
  		response.send 'Hello World!'
	)

	# app.get('/users', user.list)