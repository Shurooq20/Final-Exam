class Api::V1::BidsController < Api::ApplicationController

    def create 
        @auction = Auction.find(params[:auction_id])
        @bid = bid.new bid_params
        @bid.auction = @auction
        
        @bid.user = current_user
        if @bid.save 
            redirect_to @auction
        else 
            @bids = @auctions.bids.order(created_at: :desc)
            render(
                json: { errors: bid.errors },
                status: 422
            )
        end
    end

end