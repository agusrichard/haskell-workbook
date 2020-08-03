import React from 'react'
import { Link } from 'react-router-dom'

export default function Home(props) {
  return (
    <div className="home-container">
      <div className="home-inner">
        <h1 className="home-title">Booklist</h1>
        <p className="home-description">Create Your Reading List</p>
        <div className="home-bottom">
          <Link className="bottom-text">Login</Link>
          <Link className="bottom-text">Sign Up</Link>
        </div>
      </div>
    </div>
  )
}