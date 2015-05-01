
module.exports = (sequelize, DataTypes) ->
  sequelize.define 'Product', {
    title:
      type: DataTypes.STRING
      # unique: true
    #   len: [
    #     6
    #     75
    #   ]
    # hash: DataTypes.STRING
    # salt: DataTypes.STRING
  }