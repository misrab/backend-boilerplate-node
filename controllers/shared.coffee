
getItem = (model, fields, done)->
	model
		.find { where: fields }
		.then (result)->
			# console.log 'got: ' + JSON.stringify result.toJSON()
			done null, result
		.catch done

getItems = (model, fields, done)->
	model
		.findAll { where: fields }
		.then (result)->
			done null, result
		.catch done

postItem = (model, fields, done)->
	model
		.create fields
		.then (result)->
			done null, result
		.catch done

# make sure owner is the owner of this item
# relies on calling function to supply authentic owner
# id is required in fields
patchItem = (owner, model, fields, done)->
	searchFields = { id: fields.id }
	getItem model, searchFields, (err, result)->
		# update instancek
		result.updateAttributes fields
			.then (result)->
				done null, result
			.catch done

deleteItem = (model, id, done)->
	fields = { id: id }
	getItem model, fields, (err, result)->
		if err then return done err
		result
			.destroy()
			.then (result)->
				done()
			.catch done


module.exports = {
	getItem: getItem
	getItems: getItems
	postItem: postItem
	patchItem: patchItem
	deleteItem: deleteItem
}