import { gql } from '@apollo/client'

const SIGNUP = gql`
  mutation SignUp($username: String!, $email: String!, $password: String!) {
    register(username: $username, email: $email, password: $password) {
      id
    }
  }
`

const LOGIN = gql`
  mutation Login($email: String!, $password: String!) {
    login(email: $email, password: $password) {
      user {
        id
        username
        email
      }
      token
    }
  }
`

const GET_USERS_BOOKS = gql`
  query {
    user {
      books {
        id
        done
        title
        author
        start
        end
        comment
      }
    }
  }
`

export { SIGNUP, LOGIN, GET_USERS_BOOKS }