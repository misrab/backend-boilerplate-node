
if (!global.hasOwnProperty('db'))
  Sequelize = require 'sequelize'
  sequelize = null

  # set pg url
  pg_url = null
  if (process.env.ENV=='production')
    pg_url = process.env.HEROKU_POSTGRESQL_AQUA_URL
  else if (process.env.ENV=='staging') 
    pg_url = process.env.HEROKU_POSTGRESQL_ROSE_URL
  else
    pg_url = process.env.POSTGRESQL_LOCAL_URL


  # export POSTGRESQL_LOCAL_URL="postgres://misrab: @localhost:5432/misrab"
  match = pg_url.match(/postgres:\/\/([^:]+):([^@]+)@([^:]+):(\d+)\/(.+)/)


  # trim password to work with local ' ' setup
  sequelize = new Sequelize(match[5], match[1], match[2].trim(), {
    dialect:  'postgres',
    protocol: 'postgres',
    port:     match[4],
    host:     match[3],
    logging:  console.log,
    omitNull: true
  })

  global.db = {
    Sequelize: Sequelize,
    sequelize: sequelize,
    User:      sequelize.import(__dirname + '/user') 
     # add your other models here
  }

  
  # Associations can be defined here. E.g. like this:
  # global.db.User.hasMany(global.db.SomethingElse)
  

module.exports = global.db