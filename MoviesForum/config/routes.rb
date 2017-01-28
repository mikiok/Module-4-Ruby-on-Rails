Rails.application.routes.draw do
  get '/movies/search', to: 'movies#search'
  post '/movies', to: 'movies#search_movies'
  get '/movies/:title', to: 'movies#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
