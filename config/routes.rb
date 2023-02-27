# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "posts" => "posts#index"
  get "posts/:id" => "posts#show"
  post "posts" => "posts#create"
  put "posts/:id" => "posts#update"
  patch "posts/:id/publish" => "posts#publish"
  patch "posts/:id/unpublish" => "posts#unpublish"
  delete "posts/:id" => "posts#destroy"
  post "posts/:id/comment" => "posts#comment"

  get "article" => "articles#index"
  get "article/:id" => "articles#show"
  post "article" => "articles#create"
  put "article/:id" => "articles#update"
  delete "article/:id" => "articles#destroy"

  get "user" => "users#index"
  get "user/self" => "users#show"
  post "user" => "users#create"
  put "user/self" => "users#update"
  delete "user/self" => "users#destroy"

  post "login" => "auth#login"
end
