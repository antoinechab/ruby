Rails.application.routes.draw do

  resources :products do
    collection do
      get :export_csv
      get :export_json
    end
  end
  
  devise_for :users

  resources :users do
    post 'everybody_admin', on: :collection
  end

  resources :clients


  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :invoices, only: [:show]
end
