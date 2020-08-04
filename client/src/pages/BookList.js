import React, { useState, useEffect, useContext } from 'react'
import { useQuery } from '@apollo/client'
import Container from '../components/Container'
import { Context } from '../contexts/context'
import { GET_USERS_BOOKS } from '../graphql/query'

export default function BookList(props) {
  const { state } = useContext(Context)
  const { loading, data, error } = useQuery(GET_USERS_BOOKS)

  useEffect(() => {
    if (!state.isLoggedIn) {
      props.history.push('/login')
    }
  }, [state.isLoggedIn])
  
  if (!loading) {
    console.log('BookList data', data)
  } {
    console.log('BookList data', data, error)
  }

  return (
    <Container>
      BookList
    </Container>
  )
}