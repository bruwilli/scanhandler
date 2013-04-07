Scanhandler::Application.routes.draw do
  authenticated :user do
    root :to => 'people#index'
  end
  root :to => "people#index"
  devise_for :users
  resources :users
  match "people/search" => "people#search"
  resources :people
end