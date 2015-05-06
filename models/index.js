// Generated by CoffeeScript 1.9.2
var Sequelize, match, pg_url, sequelize;

if (!global.hasOwnProperty('db')) {
  Sequelize = require('sequelize');
  sequelize = null;
  pg_url = null;
  if (process.env.ENV === 'production') {
    pg_url = process.env.HEROKU_POSTGRESQL_AQUA_URL;
  } else if (process.env.ENV === 'staging') {
    pg_url = "postgres://postgres: @" + process.env.POSTGRES_PORT_5432_TCP_ADDR + ":5432/postgres";
  } else {
    pg_url = process.env.POSTGRESQL_LOCAL_URL;
  }
  match = pg_url.match(/postgres:\/\/([^:]+):([^@]+)@([^:]+):(\d+)\/(.+)/);
  sequelize = new Sequelize(match[5], match[1], match[2].trim(), {
    dialect: 'postgres',
    protocol: 'postgres',
    port: match[4],
    host: match[3],
    logging: console.log,
    omitNull: true
  });
  global.db = {
    Sequelize: Sequelize,
    sequelize: sequelize,
    User: sequelize["import"](__dirname + '/user'),
    Product: sequelize["import"](__dirname + '/product')
  };
}

module.exports = global.db;
