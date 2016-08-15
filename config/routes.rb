Rails.application.routes.draw do

  devise_for :users, path_names: {
    sign_up: ''
  }

  root to: "events#index"
  get '/about_us', to: 'events#about_us'
  get '/events/:id', to: 'events#show', as: 'event'

  namespace :admin do
    root to: "events#index"
    resources :events
    resources :members
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
