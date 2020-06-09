import React, { Component } from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import AuctionIndexPage from '../AuctionIndexPage';
import AuctionShowPage from '../AuctionShowPage';
import { User } from '../../requests';
import NavBar from '../NavBar';
import WelcomePage from '../WelcomePage';


class App extends Component {
    constructor(props) {
      super(props);
      this.state = {
        currentUser: false
      }
    }
  
    getUser() {
      // 1) fire off an api request to get information about the current logged in user.
      // 2) when it gets a response update the state with the user information
      User.current().then(data => {
        // console.log(data)
        this.setState((state) => {
          return {
            currentUser: data
          }
        })
      });
    }

    render() {
        return(
            <BrowserRouter>
                <main>
                <NavBar currentUser={this.state.currentUser}/>
                <Switch>
                <Route path='/weclcomePage' component={ WelcomePage}/>
                <Route path='/auctions' exact component={ AuctionIndexPage }/>
                {/* <Route path='/products/new' component={ NewProductPage } /> */}
                <Route path='/auctions/:id' component={ AuctionShowPage } />
                </Switch>    
                </main>
            </BrowserRouter>
        )
    }
}

export default App