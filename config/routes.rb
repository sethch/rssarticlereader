Rails.application.routes.draw do
  resources :articles do
    member do
      patch 'update_read_status'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "articles#index"
end
