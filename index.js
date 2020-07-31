const express = require('express')
const mongoose = require('mongoose')
const cors = require('cors')
const { graphqlHTTP } = require('express-graphql')
const schema = require('./src/schemas/schema')
const { authentication } = require('./src/middlewares/authentication')

require('dotenv').config()

// Initializng Express Application
const app = express()

// MongoDB and Mongoose Setup
mongoose.connect(process.env.URI, {useNewUrlParser: true, useUnifiedTopology: true});
mongoose.connection.once('open', () => {
  console.log('Connected to database')
})

// Middlewares
app.use(cors())

app.get('/', function(req, res) {
  res.json('Welcome to our API')
})

app.use(authentication)
app.use('/graphql', graphqlHTTP({
  schema,
  graphiql: true
}))

app.listen(process.env.PORT, () => console.log(`Running on port ${process.env.PORT}`))
