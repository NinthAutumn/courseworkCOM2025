Rails.application.routes.draw do
  # get 'pages/home'
  namespace :api, defaults: {format: :json} do
    get '/slots/:id', to:"slots#show"
    get '/slots/:park_id/open', to:"slots#availableSlot"
    post '/slots',to:"slots#create"
    post '/car_park_slots', to:"car_park_slots#create"
    get '/cars/:user_id/list', to:"cars#user_car_list"
    # get '/users/:id',to:"users#show"
    get '/users/self/show', to:"users#me"
    resources :parks
    resources :users
    resources :cars
    
    scope '/auth' do
      post '/signup', to: "users#create"
      post '/login', to: "user_token#create"
    end
  end 
  post '/contact',to:"pages#contact"
  root 'pages#home'
  get '/*path', to: 'pages#home', format: false
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
