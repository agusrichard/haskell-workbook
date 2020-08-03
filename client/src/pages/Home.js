import React from 'react'
import { Link } from 'react-router-dom'
import Container from '../components/Container'

export default function Home(props) {
  return (
    <Container>
      <h1 className="title" style={{ marginTop: '100px' }}>Booklist</h1>
      <p className="home-description">Create Your Reading List</p>
      <div className="home-bottom">
        <Link className="bottom-text" to="/login">Login</Link>
        <Link className="bottom-text" to="/signup">Sign Up</Link>
      </div>
    </Container>
  )
}