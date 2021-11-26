Rails.application.routes.draw do
  root'articles#home'
resources :articles, only:[:show,:index, :new, :create, :edit, :update, :destroy]
get 'signup' , to: 'users#new'
post 'users', to: 'users#create'
end
