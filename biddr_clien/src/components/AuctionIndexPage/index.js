import React, { Component } from 'react';
import AuctionDetails from '../AuctionDetails';

import { Link } from 'react-router-dom';
import { Auction } from '../../requests';

class AuctionIndexPage extends Component {
    constructor(props) {
        super(props);
        this.state = {
            auctions: []
        }
    }
    componentDidMount() {
        Auction.all().then((auctions) => {
           
            this.setState({
                auctions: auctions
            })
        })
    }
    render() {
        return(
            <main className='page'>
                
                { this.state.auctions.map((auction) => {
                    return(
                        <Link key={auction.id} to={`/auctions/${auction.id}`}>
                            {auction.title}
                            {auction.description}
                            {auction.price}
                        </Link>
                        
                            //   price={auction.price}
            
                    )
                })}

            </main>
        )
            
    }


}
    export default AuctionIndexPage
    