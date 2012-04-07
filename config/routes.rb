Inventnet::Application.routes.draw do

  resources :topics do
    resources :contributors, only: [:index, :new, :delete, :create, :destroy]
    resources :ideas, except: :index
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "home#index"

end
