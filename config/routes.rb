Rails.application.routes.draw do
  namespace :admin do
    get 'questions/index'
  end

  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/test"=>"test#query"

  get "/"=>"welcome#home",as: :home
  get "/about"=>"welcome#about"
  get "/contact"=>"welcome#contact"
  post "/contact_submit"=>"welcome#contact_submit"
  get "/admin/questions/index"=>"admin/questions#index"




end
