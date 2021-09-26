Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cities#index'
  resources :cities, only: %i[create index show] do
    resources :weather_previsions, only: %i[show new create]
  end
  resources :weather_types, only: [:create]
end
