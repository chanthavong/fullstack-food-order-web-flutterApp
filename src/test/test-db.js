const {
  db
} = require('../config/db.js')

db.query('SELECT * from catagories').then(rs => {
  console.log(rs);
}).catch(er => {
  console.log(er);
})