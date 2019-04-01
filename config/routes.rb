Rails.application.routes.draw do
  resources :users, :except => [:create, :index,]
  post '/signup', to: 'users#signup'
end
