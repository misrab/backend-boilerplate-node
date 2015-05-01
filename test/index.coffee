# Tests are written in Mocha.
# Be sure to start the server before running tests.

should = require 'should' 
assert = require 'assert'
request = require 'supertest'

userController = require '../controllers/users'
sharedController = require '../controllers/shared'
models = require '../models'

ROOT_URL = "http://localhost:5000/api/v1"



describe 'Routing', ()->
	# before (done)->
 #    	# In our tests we use the test db
 #    	mongoose.connect(config.db.mongodb)						
 #    	done()


	describe 'Get /', ()->
		it 'should say hello', (done)->
			request ROOT_URL
				.get '/'
				.set('Accept', 'application/json')
				.expect('Content-Type', /json/)
				.expect(200, done)




describe 'SharedController', ()->
	model = models.Product

	# FORNOW all fields are strings
	describe 'PostItem', ()->
		it 'should create an item', (done)->
			item = model.build()
			fields = {}
			for k, v of item.toJSON()
				if k == "id" then continue
				fields[k] = Math.random().toString()
			sharedController.postItem model, fields, (err, result)->
				if err then throw err
				done()

	describe 'PatchItem', ()->
		it 'should create a user and set password', (done)->
			done()

	describe 'GetItem', ()->
		it 'should create a user and set password', (done)->
			done()

	describe 'GetItems', ()->
		it 'should create a user and set password', (done)->
			done()

	describe 'DeleteItem', ()->
		it 'should create a user and set password', (done)->
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