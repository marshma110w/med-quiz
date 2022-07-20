Rails.application.routes.draw do
  get 'users/create'
  root 'main#index'
  

  resource :users, only: %i[create new]
end
