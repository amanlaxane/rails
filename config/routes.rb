Rails.application.routes.draw do
  root'articles#home'
resources :articles, only:[:show,:index, :new, :create, :edit, :update, :destroy]
get 'signup', to:'users#new'
resources:users,except:[:new]
get 'login' , to: 'session#new'
post 'login', to: 'session#create'
delete 'logout', to: 'session#destroy'

end
