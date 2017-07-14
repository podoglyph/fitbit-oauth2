Rails.application.routes.draw do
  root to: 'dashboard#index'

  get '/auth/fitbit/callback', to: 'sessions#create'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

end
