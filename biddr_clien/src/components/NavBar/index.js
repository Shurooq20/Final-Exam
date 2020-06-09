import React from 'react';
import { NavLink } from 'react-router-dom';

function NavBar(props) {
  const { currentUser } = props; // object destructuring
  return(
    <nav>
      <NavLink to='/auctions'>auctions Index</NavLink>
      | |
      <NavLink to='/weclcomePage'>Home </NavLink>
    </nav>
  )
}


export default NavBar