import React from 'react';

function AuctionDetails({ id, title, description, price, date, created_at }) {
  return(
    <div>
      <h2>{ title } | { price } | {date}</h2>
      <p>{ description }</p>

      <br></br>
      <small>Posted at: {new Date(created_at).toLocaleString()}</small>
    </div>
  )
}

export default AuctionDetails