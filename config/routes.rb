Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/restaurants/index', to: 'restaurants#index'
  get '/users/show', to: 'users#show'

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
}

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "/users/sign_up", :to => "users/registrations#new"
    get "/users/sign_in", :to => "users/sessions#new"
    get "/users/sign_out", :to => "users/sessions#destroy"
  end
end
