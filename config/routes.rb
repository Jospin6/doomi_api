Rails.application.routes.draw do
  resources :notifications
  resources :favorie_produits
  resources :notes_vitrines
  resources :followers
  resources :vitrines
  resources :paiements
  resources :transactions
  resources :calls
  resources :messages
  resources :participants
  resources :conversations
  resources :produits
  resources :sub_categorie_produits
  resources :categorie_produits
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  namespace :api do
    namespace :v1 do
      post 'confirm_code', to: 'users#confirm_code'
      post 'resend_confirmation_code', to: 'users#resend_confirmation_code'
    end
  end
end
