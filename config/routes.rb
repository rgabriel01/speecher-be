Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :speeches, only: %i[index create update]

  get '/speeches/fetch_by_author/:author_id', to: 'speeches#fetch_by_author', as: :fetch_by_author, defaults: { format: 'json' }
end
