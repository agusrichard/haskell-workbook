const mongoose = require('mongoose')

const bookSchema = new mongoose.Schema({
  userId: String,
  done: Boolean,
  title: String,
  start: { type: Date, default: Date.now },
  end: Date,
  comment: String
})

module.exports = mongoose.model('Book', bookSchema)