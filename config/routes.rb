Scanhandler::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_scope :user do
  	root :to => "devise/sessions#new"
  end
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  devise_for :users

  resources :users
  match "people/search" => "people#search"
  resources :people
end