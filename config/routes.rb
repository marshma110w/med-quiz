Rails.application.routes.draw do
  get 'quiz/try'
  root 'users#new'
  

  resources :users, only: %i[create new]
end
