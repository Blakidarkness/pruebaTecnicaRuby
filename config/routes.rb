Rails.application.routes.draw do
  get 'welcome/index'
  resources :categories
  post 'categories/save/:id(.:format)', to: 'categories#actualizar'
  resources :projects
  post 'projects/save/:id(.:format)', to: 'projects#actualizar'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
