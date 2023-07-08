Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :speeches, only: %i[index create update], defaults: { format: 'json' }
  resources :users, only: %i[index], defaults: { format: 'json' }

  get '/speeches/fetch_by_author/:author_id', to: 'speeches#fetch_by_author', as: :fetch_by_author, defaults: { format: 'json' }
  get '/speeches/search', to: 'speeches#search', as: :search, defaults: { format: 'json' }

  get '/users/authenticate', to: 'users#authenticate', as: :authenticate, defaults: { format: 'json' }
end
