Codebnb::Application.routes.draw do
  root :to => "home#index"
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin


end
