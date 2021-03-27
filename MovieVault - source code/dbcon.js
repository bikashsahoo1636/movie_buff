var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'localhost',
  user            : 'root',
  password        : 'bottletopple202',
  database        : 'csdb'
});
module.exports.pool = pool;
