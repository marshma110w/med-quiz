Rails.application.routes.draw do
  root 'users#new'
  

  resource :users, only: %i[create new]
end
