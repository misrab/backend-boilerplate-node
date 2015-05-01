
getItem = (model, fields, done)->
	model
		.find { where: fields }
		.then (result)->
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
patchItem = (owner, model, fields, done)->
	return

deleteItem = (model, id, done)->
	fields = { id: id }
	getItem model, fields, (err, result)->
		if err then return done err
		result
			.destroy()
			.then done
			.catch done


module.exports = {
	getItem: getItem
	getItems: getItems
	postItem: postItem
	patchItem: patchItem
	deleteItem: deleteItem
}