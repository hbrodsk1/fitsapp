Rails.application.routes.draw do
  root 'pages#dashboard'
  get 'home', to: 'pages#dashboard', as: :home
  
  resources :messages, only: [:index, :new, :create]

  devise_for :clients, controllers: { registrations: "registrations" }
end
