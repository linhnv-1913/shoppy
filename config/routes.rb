Rails.application.routes.draw do
  namespace :api do
    namespace :admin do
      resources :sessions, only: :create
      resources :forgot_passwords, only: :create
      resource :reset_passwords, only: %i(edit update)
    end
    
    resources :sessions, only: :create
    resources :forgot_passwords, only: :create
    resource :reset_passwords, only: %i(edit update)
    resources :admins, only: %i(create index destroy)
    resources :users, only: %i(edit update)
  end
end
