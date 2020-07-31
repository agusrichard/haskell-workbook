const graphql = require('graphql')
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
      resolve: (parent, args) => {
        console.log('something here')
      }
    }
  })
})

const BookType = new graphql.GraphQLObjectType({
  name: 'Book',
  fields: () => ({
    id: { type: graphql.GraphQLID },
    userId: { type: grapqhl.GraphQLID },
    haveRead: { type: graphql.GraphQLBoolean },
    title: { type: graphql.GraphQLString },
    start: { type: graphql.GraphQLString },
    end: { type: graphql.GraphQLString },
    comment: { type: graphql.GraphQLString }
  })
})

const RootQuery = new graphql.GraphQLObjectType({

})

const Mutation = new graphql.GraphQLObjectType({
  name: 'Mutation',
  fields: {
    register: {
      type: UserType,
      args: {
        username: { type: new graphql.GraphQLNonNull(grapqhl.GraphQLString) },
        email: { type: new graphql.GraphQLNonNull(grapqhl.GraphQLString) },
        password: { type: new graphql.GraphQLNonNull(grapqhl.GraphQLString) }
      },
      resolve: (parent, args) => {
        let user = User({
          username: args.username,
          email: args.email,
          password: args.password
        })
        user.save()
      }
    }
  }
})


module.exports = new graphql.GraphQLSchema({
  query: RootQuery,
  mutation: Mutation
})
