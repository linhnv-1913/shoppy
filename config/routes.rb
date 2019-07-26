Rails.application.routes.draw do
  namespace :api do
    namespace :admin do
      resources :sessions, only: :create
      resources :forgot_passwords, only: :create
      resource :reset_passwords, only: :edit
    end
  
    resources :sessions, only: :create
    resources :forgot_passwords, only: :create
    resource :reset_passwords, only: :edit
  end
end
