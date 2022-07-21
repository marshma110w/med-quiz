Rails.application.routes.draw do
  get 'quiz/try'
  root 'users#new'
  

  resource :users, only: %i[create new]
end
