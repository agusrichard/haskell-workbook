const graphql = require('graphql')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')


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
    haveRead: { type: graphql.GraphQLBoolean },
    title: { type: graphql.GraphQLString },
    start: { type: graphql.GraphQLString },
    end: { type: graphql.GraphQLString },
    comment: { type: graphql.GraphQLString },
    user: { 
      type: UserType
    }
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
      resolve: (source, args, context) => {
        if (context.userId) {
          return context.User.find({})
        } else {
          throw new Error('Not Authenticated')
        }
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
      resolve: async (source, args, context) => {
        let user = context.User({
          username: args.username,
          email: args.email,
          password: bcrypt.hashSync(args.password, process.env.SALT)
        })
        return await user.save()
      }
    },
    login: {
      type: LoginType,
      args: {
        email: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) },
        password: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) }
      },
      resolve: async (source, args, context) => {
        let user = await context.User.findOne({ email: args.email })
        if (user.password) {
          if (bcrypt.compareSync(args.password, user.password)) {
            let token = jwt.sign({ userId: user.id, username: user.username }, process.env.SECRET_KEY)
            return {token, user}
          } else {
            return null
          }
        } else {
          return null
        }
      }
    }
  }
})


module.exports = new graphql.GraphQLSchema({
  query: RootQuery,
  mutation: Mutation
})
