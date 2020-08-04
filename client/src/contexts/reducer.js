import { useReducer } from 'react'

const initialState = {
  token: '',
  isLoggedIn: false
}

function reducer(state, action) {
  switch (action.type) {
    case 'LOGIN':
      return {
        ...state,
        token: action.payload,
        isLoggedIn: true
      }
    case 'LOGOUT':
      return {
        ...state,
        token: '',
        isLoggedIn: false
      }
  }
}

export default () => useReducer(reducer, initialState)