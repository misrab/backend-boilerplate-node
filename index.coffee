express = require "express"
http = require "http"

db = require "./models"



app = express()

# do config
require("./config/environment")(app, express)

# set up routes
require("./config/routes") app



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