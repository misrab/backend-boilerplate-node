


module.exports = (app, express)->
	app.set('port', (process.env.PORT || 5000))

	# app.use(express.logger('dev'))
	# app.use(express.bodyParser())
	# app.use(express.methodOverride())
	# app.use(app.router)



	# app.configure('development', ()->
	# 	app.use(express.errorHandler({
	# 		dumpExceptions: true,
	# 		showStack: true
	# 	}))
	# )

	# app.configure('production', ()->
	# 	app.use express.errorHandler()
	# )

	# # development only
	# if 'development' == process.env.ENV
		# app.use(express.errorHandler())