Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'article' => 'articles#index'
  get 'article/:id' => 'articles#show'
  post 'article' => 'articles#create'
  put 'article/:id' => 'articles#update'
  delete 'article/:id' => 'articles#destroy'

  # resources :article, only: [:index, :show, :create, :update, :destroy]

end
