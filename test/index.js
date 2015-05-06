// Generated by CoffeeScript 1.9.2
var ROOT_URL, assert, async, models, request, sharedController, should, userController;

async = require('async');

should = require('should');

assert = require('assert');

request = require('supertest');

userController = require('../controllers/users');

sharedController = require('../controllers/shared');

models = require('../models');

ROOT_URL = "http://localhost:8080/api/v1";

describe('Routing', function() {
  describe('Get /', function() {
    return it('should say hello', function(done) {
      return request(ROOT_URL).get('?secret=fdsjfk32r90r32orjf3902j3j3felkfds').set('Accept', 'application/json').expect('Content-Type', /json/).expect(200, done);
    });
  });
  return describe('Login', function() {
    return it('should handle a user object', function(done) {
      var postData;
      postData = {
        email: "foo@foo.com",
        password: "lalala"
      };
      return request(ROOT_URL).post('/user/socialLogin?secret=fdsjfk32r90r32orjf3902j3j3felkfds').send(postData).set('Accept', 'application/json').expect('Content-Type', /json/).expect(200, done);
    });
  });
});

describe('SharedController', function() {
  var buildItem, ids, model;
  model = models.Product;
  ids = [];
  buildItem = function(model, done) {
    var fields, item, k, ref, v;
    item = model.build();
    fields = {};
    ref = item.toJSON();
    for (k in ref) {
      v = ref[k];
      if (k === "id") {
        continue;
      }
      fields[k] = Math.random().toString();
    }
    return sharedController.postItem(model, fields, function(err, result) {
      if (err) {
        throw err;
      }
      ids.push(result.id);
      return done(null, result);
    });
  };
  describe('PostItem', function() {
    return it('should create an item', function(done) {
      return buildItem(model, function(err, result) {
        return done();
      });
    });
  });
  describe('GetItem', function() {
    return it('should get an item', function(done) {
      var fields;
      fields = {
        id: ids[0]
      };
      return sharedController.getItem(model, fields, function(err, result) {
        if (err) {
          throw err;
        }
        return done();
      });
    });
  });
  describe('GetItems', function() {
    return it('get all items', function(done) {
      return sharedController.getItems(model, {}, function(err, result) {
        if (err) {
          throw err;
        }
        return done();
      });
    });
  });
  describe('PatchItem', function() {
    return it('should create a user and set password', function(done) {
      var fields;
      fields = {
        id: ids[0],
        title: 'foofofoo'
      };
      return sharedController.patchItem({}, model, fields, done);
    });
  });
  return describe('DeleteItem', function() {
    return it('should delete all items created in this test', function(done) {
      return async.each(ids, function(id, cb) {
        return sharedController.deleteItem(model, id, cb);
      }, function(err) {
        console.log("FINISHED");
        if (err) {
          throw err;
        }
        return done();
      });
    });
  });
});

describe('UserController', function() {
  return describe('PostUser', function() {
    return it('should create a user and set password', function(done) {
      var fields, name;
      name = Math.random().toString();
      fields = {
        email: name + '@misrab.com',
        password: 'lalala'
      };
      return userController.postUser(fields, function(err, user) {
        if (err) {
          throw new Error("Error creating user: " + JSON.stringify(err));
        }
        if (!user.hash) {
          throw new Error("Hash not set");
        }
        return done();
      });
    });
  });
});