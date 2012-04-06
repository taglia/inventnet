Inventnet::Application.routes.draw do

  resources :topics do
    resources :contributors, only: [:index, :new, :delete, :create, :destroy]
    resources :ideas, except: :index
  end

  devise_for :users

  root to: "home#index"

end
