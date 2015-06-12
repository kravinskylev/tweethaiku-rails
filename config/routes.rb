Rails.application.routes.draw do
  resources :songs do
    member do
      post 'upvote'
    end
  end

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  #get '/contact', render template: "views/static/about"

  root :to => "songs#index"
end
