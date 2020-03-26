Rails.application.routes.draw do
  get "/home/index",  to: 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :categories
  post 'categories/save/:id(.:format)', to: 'categories#actualizar'
  resources :projects
  post 'projects/save/:id(.:format)', to: 'projects#actualizar'
  post 'projects/categoria', to: 'projects#buscar'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
