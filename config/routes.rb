Codebnb::Application.routes.draw do


  root :to => "home#index"

  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin
  match '/auth/:provider/callback', to: 'sessions#create'

  resource :profile, module: :user do
    resource :venues
  end

  resources :venue do
    resource :reservation, module: :venues
  end

end
