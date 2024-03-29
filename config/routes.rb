Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'quiz/try'
  post 'quiz/user_answer'

  root 'users#index'

  resources :users, only: %i[create new edit update]
  resource :session, only: %i[new create destroy]
end
