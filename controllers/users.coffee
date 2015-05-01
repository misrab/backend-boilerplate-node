User = require("../models").User

shared = require "./shared"


# needs special password set
postUser = (fields, done)->
	user = User.build(fields)
	user.setPassword fields.password, (err, user)->
		if err then return done(err)
		user.save()
			.then (user)->
				done(null, user)
			.catch done


# getUser = (fields, done)->
# 	done null, null

# getUsers = (fields, done)->
# 	done null, []


module.exports = {
	# getUsers: getUsers
	# getUser: getUser
	postUser: postUser
}