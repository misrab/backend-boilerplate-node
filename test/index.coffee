# Tests are written in Mocha.
# Be sure to start the server before running tests.

should = require 'should' 
assert = require 'assert'
request = require 'supertest'

userController = require '../controllers/users'

ROOT_URL = "http://localhost:5000"



describe 'Routing', ()->
	describe 'Get /', ()->
		it 'should say hello', (done)->
			request ROOT_URL
				.get '/'
				.set('Accept', 'application/json')
				.expect('Content-Type', /json/)
				.expect(200, done)




describe 'Controllers', ()->
	describe 'GetUsers', ()->
		it 'should get all users', (done)->
			userController.getUsers (err, users)->
				console.log users
				done()