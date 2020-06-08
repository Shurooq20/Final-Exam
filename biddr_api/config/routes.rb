Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do 
    resources :dashboard, only: [:index]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :auctions, only: [:index, :show, :create, :update]
      resource :bids, only: [:create]
      resource :session, only: [:create, :destroy]

    end
  end
end
