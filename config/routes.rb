Rails.application.routes.draw do
  get 'pages/blog'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    root "pages#blog"
  # Defines the root path route ("/")
  # root "articles#index"
end
