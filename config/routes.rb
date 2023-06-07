Rails.application.routes.draw do

  resources :product_delivery_dates do
    collection do
      get :archive_all
    end
  end

  resources :products do
    collection do
      get :export_csv
      get :export_json
      get :export_pdf
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
