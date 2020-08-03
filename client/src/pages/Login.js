import React from 'react'
import { Link } from 'react-router-dom'
import Input from '../components/Input'
import Container from '../components/Container'
import Button from '../components/Button'
import { LOGIN } from '../graphql/query'

export default function Login(props) {
  return (
    <Container>
      <h1 className="title" style={{ marginTop: 50, marginBottom: 75 }}>Login</h1>
      <form>
        <Input placeholder="Email" type="email" />
        <Input placeholder="Password" type="password" />
        <Button title="Login" style={{ marginTop: 30 }}/>
      </form>
      <Link to="/signup" className="bottom-link">Have no account?</Link>
    </Container>
  )
}