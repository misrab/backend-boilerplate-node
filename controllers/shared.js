// Generated by CoffeeScript 1.9.2
var deleteItem, getItem, getItems, patchItem, postItem;

getItem = function(model, fields, done) {
  return model.find({
    where: fields
  }).then(function(result) {
    return done(null, result);
  })["catch"](done);
};

getItems = function(model, fields, done) {
  return model.findAll({
    where: fields
  }).then(function(result) {
    return done(null, result);
  })["catch"](done);
};

postItem = function(model, fields, done) {
  return model.create(fields).then(function(result) {
    return done(null, result);
  })["catch"](done);
};

patchItem = function(owner, model, fields, done) {
  var searchFields;
  searchFields = {
    id: fields.id
  };
  return getItem(model, searchFields, function(err, result) {
    return result.updateAttributes(fields).then(function(result) {
      return done(null, result);
    })["catch"](done);
  });
};

deleteItem = function(model, id, done) {
  var fields;
  fields = {
    id: id
  };
  return getItem(model, fields, function(err, result) {
    if (err) {
      return done(err);
    }
    return result.destroy().then(function(result) {
      return done();
    })["catch"](done);
  });
};

module.exports = {
  getItem: getItem,
  getItems: getItems,
  postItem: postItem,
  patchItem: patchItem,
  deleteItem: deleteItem
};
