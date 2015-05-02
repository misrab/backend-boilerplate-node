# Tests are written in Mocha.
# Be sure to start the server before running tests.

async = require 'async'

should = require 'should' 
assert = require 'assert'
request = require 'supertest'

userController = require '../controllers/users'
sharedController = require '../controllers/shared'
models = require '../models'

ROOT_URL = "http://localhost:5000/api/v1"



describe 'Routing', ()->

	describe 'Get /', ()->
		it 'should say hello', (done)->
			request ROOT_URL
				.get '?secret=fdsjfk32r90r32orjf3902j3j3felkfds'
				.set('Accept', 'application/json')
				.expect('Content-Type', /json/)
				.expect(200, done)


	describe 'Social login', ()->
		it 'should handle a user object', (done)->
			postData = {
				email: "foo@foo.com"
				password: "lalala"
			}

			request ROOT_URL
				.post '/user/socialLogin?secret=fdsjfk32r90r32orjf3902j3j3felkfds'
				.send(postData)
				.set('Accept', 'application/json')
				.expect('Content-Type', /json/)
				.expect(200, done)


# TODO test query params
describe 'SharedController', ()->
	model = models.Product
	ids = [] # list of created ids

	buildItem = (model, done)->
		item = model.build()
		fields = {}
		for k, v of item.toJSON()
			if k == "id" then continue
			fields[k] = Math.random().toString()
		sharedController.postItem model, fields, (err, result)->
			if err then throw err
			# add id to created items
			ids.push result.id
			done(null, result)

	# FORNOW all fields are strings
	describe 'PostItem', ()->
		it 'should create an item', (done)->
			buildItem model, (err, result)->
				done()


	describe 'GetItem', ()->
		it 'should get an item', (done)->
			fields = { id: ids[0] }
			sharedController.getItem model, fields, (err, result)->
				if err then throw err
				done()

	describe 'GetItems', ()->
		it 'get all items', (done)->
			sharedController.getItems model, {}, (err, result)->
				if err then throw err
				done()

	describe 'PatchItem', ()->
		it 'should create a user and set password', (done)->
			fields = {
				id: ids[0]
				title: 'foofofoo' # ASSUMING field here
			}
			sharedController.patchItem {}, model, fields, done

	# also acts as cleanup
	describe 'DeleteItem', ()->
		it 'should delete all items created in this test', (done)->
			async.each ids,
				(id, cb)->
					sharedController.deleteItem model, id, cb
				(err)->
					console.log "FINISHED"
					if err then throw err
					done()



describe 'UserController', ()->
	# TODO clear the database


	describe 'PostUser', ()->
		it 'should create a user and set password', (done)->
			name = Math.random().toString()
			fields = { 
				email: name+'@misrab.com'
				password: 'lalala'
			}
			userController.postUser fields, (err, user)->
				if err then throw new Error "Error creating user: " + JSON.stringify err
				if !user.hash then throw new Error "Hash not set"
				# console.log user
				done()

	# cleanup
	# describe 'DeleteUser', ()->
