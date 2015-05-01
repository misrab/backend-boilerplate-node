# Tests are written in Mocha.
# Be sure to start the server before running tests.

should = require 'should' 
assert = require 'assert'
request = require 'supertest'

userController = require '../controllers/users'

ROOT_URL = "http://localhost:5000/api/v1"



describe 'Routing', ()->
	describe 'Get /', ()->
		it 'should say hello', (done)->
			request ROOT_URL
				.get '/'
				.set('Accept', 'application/json')
				.expect('Content-Type', /json/)
				.expect(200, done)




describe 'UserController', ()->
	describe 'PostUser', ()->
		it 'should create a user and set password', (done)->
			fields = { 
				email: 'misrab@misrab.com'
				password: 'lalala'
			}
			userController.postUser fields, (err, user)->
				if err then throw new Error "Error creating user: " + JSON.stringify err
				console.log user
				done()

	describe 'GetUsers', ()->
		it 'should get all users', (done)->
			userController.getUsers {}, (err, users)->
				console.log users
				done()