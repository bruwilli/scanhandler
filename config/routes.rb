Scanhandler::Application.routes.draw do
  match "users/inactive" => "root#inactive"
  authenticated :user do
    root :to => 'root#index'
  end
  devise_scope :user do
  	root :to => "devise/sessions#new"
  end
  devise_for :users, :skip => [:registrations], :controllers => { :invitations => 'users/invitations' }
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :users
  match "people/search" => "people#search"
  resources :people do
    resources :scans, only: [:create, :destroy]
  end
  match "scans/:id" => "scans#download", via: :get, as: :download_scan
  match "scans/:id" => "scans#destroy", via: :delete, as: :destroy_scan
end