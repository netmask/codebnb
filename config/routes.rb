Codebnb::Application.routes.draw do


  root :to => "home#index"

  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin
  match '/auth/:provider/callback', to: 'sessions#create'

  resource :profile, module: :user do
    resources :venues do
      resources :periods
    end

    resource :requests do
      match 'accept/:reservation' => 'user/requests#accept', :via => :post, :as => :accept
      match 'decline/:reservation' => 'user/requests#decline', :via => :post, :as => :decline
    end
  end

  resources :venues do
    collection do
      get :near
    end
    resources :reservations, module: :venues
  end

end
