Rails.application.routes.draw do
#  mount Rswag::Ui::Engine => '/api-docs'
#  mount Rswag::Api::Engine => '/api-docs'

#      get 'signup/create'
#      get 'signin/create'
#      get 'signin/destroy'

  namespace :api do
    namespace :v1 do
      resources :records
      resources :artists
    end
  end

  root to: 'home#index' 

  post "refresh", controller: :refresh, action: :create
  post "signin", controller: :signin, action: :create
  post "signup", controller: :signup, action: :create

  delete "signin", controller: :signin, action: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
