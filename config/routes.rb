Rails.application.routes.draw do
  get '/game', to: 'parties#game'

  get '/score', to: 'parties#score'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
