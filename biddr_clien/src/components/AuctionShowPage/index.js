import React, { Component } from 'react'

import AuctionDetails from '../AuctionDetails';

import { Auction }from '../../requests'

class AuctionShowPage extends Component {

    constructor(props) {
        super(props);
        this.state = {
            // auction: auctionData
            auction: {}
        }
    }

    componentDidMount(){
        Auction.one(this.props.match.params.id).then((auction) => {
            // console.log(auction)
            this.setState((state) => {
                return {
                    auction
                }
            })
        })
    }

    render() {
        const { id, title, description, created_at, price} = this.state.auction;
        return (
            <main className='page'>
                {
                    id ?
                    <AuctionDetails 
                        id={id}
                        title={title}
                        price={price}
                        description={description}
                        created_at={created_at}
                    
                    /> :null
                
                }            
            </main>
          )


    }

}


export default AuctionShowPage