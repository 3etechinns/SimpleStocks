Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'static_pages#root'
    namespace :api, defaults: { format: :json } do
      resources :users, only: [:create, :show]
      resources :stocks, only: [:index]
      resources :orders, only: [:create]
      resources :watches, only: [:create, :destroy, :index]
      resources :portfolio_snapshots, only: [:create, :index]
      get '/portfolio/daily', to: 'portfolio_snapshots#single_day_portfolio'
      resource :session, only: [:create, :destroy]
    end

end
