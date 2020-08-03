const graphql = require('graphql')
const bcrypt = require('bcrypt')
const { getUserId, login } = require('../utils')


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
    haveRead: { type: graphql.GraphQLBoolean },
    title: { type: graphql.GraphQLString },
    start: { type: graphql.GraphQLString },
    end: { type: graphql.GraphQLString },
    comment: { type: graphql.GraphQLString },
    user: { 
      type: UserType,
      resolve: async (parent, args, context) => {
        console.log('BookType parent', parent.id)
        const user = context.User.find({ 'books': { $gte: parent.id } })
        console.log('user', user)
        return user
      }
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
      resolve: (parent, args, context) => {
        const userId = getUserId(context)
        return context.User.find({})
      }
    },
    books: {
      type: new graphql.GraphQLList(BookType),
      resolve: (parent, args, context) => {
        const userId = getUserId(context)
        return context.Book.find({})
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
        password: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) },
        fullname: { type: graphql.GraphQLString } 
      },
      resolve: async (parent, args, context) => {
        let user = context.User({
          username: args.username,
          email: args.email,
          fullname: args.fullname,
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
      resolve: async (parent, args, context) => {
        const user = await context.User.findOne({ email: args.email })
        return login(user, args.password)
      }
    },
    addBook: {
      type: BookType,
      args: {
        title: { type: new graphql.GraphQLNonNull(graphql.GraphQLString) }
      },
      resolve: async (parent, args, context) => {
        const userId = getUserId(context)
        const user = await context.User.findById(userId)
        let book = context.Book({
          userId,
          done: false,
          title: args.title
        })
        user.books.push(book.id)
        user.save()
        return await book.save()
      }
    }
  }
})


module.exports = new graphql.GraphQLSchema({
  query: RootQuery,
  mutation: Mutation
})
