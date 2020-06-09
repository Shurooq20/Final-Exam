import React from 'react'

function BidDetails({ id, title, created_at }) {
  


  
  return(
    <div>
      <h4>{ title }</h4>
      <small>Created at: { new Date(created_at).toLocaleDateString() }</small>

    </div>
  )
}

export default BidDetails