import React from 'react'

export default function Button(props) {
  return (
    <button className="button" style={props.style}>
      { props.title }
    </button>
  )
}