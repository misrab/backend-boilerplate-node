// Generated by CoffeeScript 1.9.2
var User, postUser, shared;

User = require("../models").User;

shared = require("./shared");

postUser = function(fields, done) {
  var user;
  user = User.build(fields);
  return user.setPassword(fields.password, function(err, user) {
    if (err) {
      return done(err);
    }
    return user.save().then(function(user) {
      return done(null, user);
    })["catch"](done);
  });
};

module.exports = {
  postUser: postUser
};
