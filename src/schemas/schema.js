const graphql = require('graphql')
const bcrypt = require('bcrypt')
const User = require('../models/user')
const Book = require('../models/book')


const UserType = new graphql.GraphQLObjectType({
  name: 'User',
  fields: () => ({
    id: { type: graphql.GraphQLID },
    username: { type: graphql.GraphQLString },
    email: { type: graphql.GraphQLString },
    password: { type: graphql.GraphQLString },
    fullname: { type: graphql.GraphQLString },
    books: {
      type: BookType,
      resolve: (source, args) => {
        console.log('something here')
      }
    }
  })
})

const BookType = new graphql.GraphQLObjectType({
  name: 'Book',
  fields: () => ({
    id: { type: graphql.GraphQLID },
    userId: { type: graphql.GraphQLID },
    haveRead: { type: graphql.GraphQLBoolean },
    title: { type: graphql.GraphQLString },
    start: { type: graphql.GraphQLString },
    end: { type: graphql.GraphQLString },
    comment: { type: graphql.GraphQLString }
  })
})

const LoginType = new graphql.GraphQLObjectType({
  name: 'Login',
  fields: () => ({
    token: { type: graphql.GraphQLString },
    user: { type: UserType }
  })
})

const RootQuery = new graphql.GraphQLObjectType({
  name: 'RootQuery',
  fields: {
    users: {
      type: new graphql.GraphQLList(UserType),
      resolve: (source, args) => {
        console.log('RootQuery')
      }
    }
  }
})

const Mutation = new graphql.GraphQLObjectType({
  name: 'Mutation',
  fields: {
    register: {
      type: UserType,
      args: {
        username: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) },
        email: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) },
        password: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) }
      },
      resolve: (source, args) => {
        const salt = bcrypt.genSaltSync(10)
        let user = User({
          username: args.username,
          email: args.email,
          password: bcrypt.hashSync(args.password, salt)
        })
        return user.save()
      }
    },
    login: {
      type: LoginType,
      args: {
        email: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) },
        password: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) }
      },
      resolve: (source, args) => {
        console.log('login')
      }
    }
  }
})


module.exports = new graphql.GraphQLSchema({
  query: RootQuery,
  mutation: Mutation
})
