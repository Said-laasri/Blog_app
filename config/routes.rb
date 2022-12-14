Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, sign_out_via: [:get, :post]
  # get 'likes/create'
  # get 'comments/create'
  resources :users do 
    resources :posts 
  end 
  resources :posts do
     resources :comments 
     resources :likes 
  end
  root to: "users#index"
  post 'authenticate', to: 'authentication#authenticate'
  namespace :api do
    resources :users do 
      resources :posts 
    end 
    resources :posts do
       resources :comments 
       resources :likes 
    end
  end
end
