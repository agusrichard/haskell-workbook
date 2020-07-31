const User = require('../models/user')

function authentication(req, res, next) {
  let token = req.headers.authorization || ''
  console.log('token', token)
  next()
}


module.exports = { authentication }