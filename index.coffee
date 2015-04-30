express = require "express"

routes = require "./config/routes"


app = express()
app.set 'port', (process.env.PORT || 5000)
app.use express.static __dirname + '/public'



# set up routes
routes app


# # catch 404 and forward to error handler
# app.use((req, res, next)->
#     err = new Error('Not Found')
#     err.status = 404
#     next(err)
# )



app.listen(app.get('port'), ()->
  console.log 'Node app is running on port ' + app.get('port')
)