Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'quiz/try'
  root 'users#new'
  

  resource :users, only: %i[create new]
end
