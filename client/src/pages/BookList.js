import React, { useState, useEffect, useContext } from 'react'
import { useQuery } from '@apollo/client'
import Container from '../components/Container'
import { Context } from '../contexts/context'
import { GET_USERS_BOOKS } from '../graphql/query'
import BookItem from '../components/BookItem'

export default function BookList(props) {
  const { state } = useContext(Context)
  const { loading, data, error } = useQuery(GET_USERS_BOOKS, {
    context: {
      headers: {
        authorization: `Bearer ${state.token}`
      }
    }
  })

  if (!loading) {
    console.log('user data', data.user.books)
  }

  return (
    <Container>
      <h1 className="title" style={{ marginTop: '25px' }}>Reading List</h1>
      <div>
        <button className="choose-button">On Progress</button>
        <button className="choose-button">Completed</button>
      </div>
      <div style={{ marginTop: 30 }}>
        { !loading && data.user.books.map(book => (
          <BookItem key={ book.id } book={ book } />
        )) }
      </div>
    </Container>
  )
}