Rails.application.routes.draw do
  get 'cities/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cities#index'
  resources :cities, only: %i[create index show] do
    resources :weather_previsions, only: %i[new create edit update]
  end
  resources :wind_directions, only: [:create]
  resources :weather_types, only: [:create]
end
