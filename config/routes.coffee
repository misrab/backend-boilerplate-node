module.exports = (app)->
	app.get('/api/v1', (request, response)->
  		response.json 200
	)



	