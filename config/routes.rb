Scanhandler::Application.routes.draw do
  authenticated :user do
    root :to => 'people#index'
  end
  devise_scope :user do
  	root :to => "devise/sessions#new"
  end
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  devise_for :users

  resources :users
  match "people/search" => "people#search"
  resources :people do
    resources :scans, only: [:create, :destroy]
  end
  match "scans/:id" => "scans#download", via: :get, as: :download_scan
  match "scans/:id" => "scans#destroy", via: :delete, as: :destroy_scan
end