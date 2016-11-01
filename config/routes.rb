Rails.application.routes.draw do


  # get 'tags/index'
  #
  # get 'tags/show'
  resources :tags,only:[:index,:show]


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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/test" => "test#query"

  get "/" => "welcome#home", as: :home
  get "/about" => "welcome#about"
  get "/contact" => "welcome#contact"
  post "/contact_submit" => "welcome#contact_submit"
  get "/admin/questions/index" => "admin/questions#index"


end
