Rails.application.routes.draw do
  root 'pages#dashboard'
  get 'home', to: 'pages#dashboard', as: :home

  devise_for :clients
end
