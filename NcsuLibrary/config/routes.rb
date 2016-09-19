Rails.application.routes.draw do
  resources :rooms
 root 'welcome#index'

  resources :users
  resources :libraries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
