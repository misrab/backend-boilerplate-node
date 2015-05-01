express = require "express"
http = require "http"

db = require "./models"



app = express()

# do config
require("./config/environment")(app, express)

# set up routes
require("./config/routes") app


# clear database if appropriate
clearDB = null
if process.env.ENV=='development'
	clearDB = (next) ->
		db.sequelize.drop().then(next).catch(next)
		#next(null);
else if process.env.ENV=='staging'
	clearDB = (next)->
		next(null)
else
	#!!! PRODUCTION, CAREFUL !!!
	clearDB = (next)->
		next(null)


clearDB (err)->
	db.sequelize.sync().then(()->
	  http.createServer(app).listen(app.get('port'), ()->
	    console.log('Express server listening on port ' + app.get('port'))
	  )
	)

# # catch 404 and forward to error handler
# app.use((req, res, next)->
#     err = new Error('Not Found')
#     err.status = 404
#     next(err)
# )

# app.listen(app.get('port'), ()->
#   console.log 'Node app is running on port ' + app.get('port')
# )