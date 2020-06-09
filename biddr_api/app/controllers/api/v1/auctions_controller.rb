class Api::V1::AuctionsController < Api::ApplicationController

    before_action :authenticate_user!, only: [:create, :update, :destroy]

    def index
        auctions = Auction.all.order('created_at DESC')
        render json: auctions
    end

    def show
        auction = Auction.find params[:id]
        render json: auction
    end

    def create
        auction = Auction.new params.require(:auction).permit(:title, :description)
        auction.user = current_user
        if auction.save
           render json: { id: auction.id } 
        else
            render(
                json: { errors: auction.errors },
                status: 422
            )
        end
    end

    def update
        auction = auction.find params[:id]
        if auction.update params.require(:auction).permit(:title, :description)
            render json: auction
        else
            render(
                json: { errors: auction.errors },
                status: 422
            )
        end
    end
end
