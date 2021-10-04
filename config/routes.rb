Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get 'home/index'
  get 'home/about'
  get 'home/contact'
  get 'home/help'
  resources :posts
  resources :images do
    member do
      post :add_tag
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



