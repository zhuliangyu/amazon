Rails.application.routes.draw do


  get 'callbacks/twitter'

  # get 'http://127.0.0.1:3000/auth/twitter/'
  get '/auth/twitter', as: :sign_in_with_twitter
  get '/auth/twitter/callback' => 'callbacks#twitter'

  # get '/auth/facebook?display=popup', as: :sign_in_with_facebook
  get '/auth/facebook', as: :sign_in_with_facebook
  get '/auth/facebook/callback' => 'callbacks#facebook'

  # get 'tags/index'
  #
  # get 'tags/show'
  resources :tags, only: [:index, :show]


  namespace :admin do
    get 'questions/index'
  end

  resources :products, shallow: true do
    # resources :products do

    resources :favourites, only: [:create, :destroy]
    resources :reviews
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection

  end


  namespace :api, default: {format: 'json'} do
    namespace :v1 do
      resources :products
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/test" => "test#query"

  get "/" => "welcome#home", as: :home
  get "/about" => "welcome#about"
  get "/contact" => "welcome#contact"
  post "/contact_submit" => "welcome#contact_submit"
  get "/admin/questions/index" => "admin/questions#index"


end
