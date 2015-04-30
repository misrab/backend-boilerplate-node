


getUser = (fields, done)->
	done null, null

getUsers = (fields, done)->
	done null, []


module.exports = {
	getUsers: getUsers
	getUser: getUser
}