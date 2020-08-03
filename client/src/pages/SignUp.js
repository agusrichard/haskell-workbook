import React from 'react'
import { Link } from 'react-router-dom'
import Input from '../components/Input'
import Container from '../components/Container'
import Button from '../components/Button'

export default function Login(props) {
  return (
    <Container>
      <h1 className="title" style={{ marginTop: 30, marginBottom: 50 }}>Sign Up</h1>
      <form>
        <Input placeholder="Username" type="text" />
        <Input placeholder="Email" type="email" />
        <Input placeholder="Password" type="password" />
        <Button title="Sign Up" style={{ marginTop: 20 }}/>
      </form>
      <Link to="/login" className="bottom-link">Already have an account?</Link>
    </Container>
  )
}