Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  namespace :api do
    namespace :v1 do
      post 'confirm_code', to: 'compte_info#confirm_code'
      post 'resend_confirmation_code', to: 'compte_info#resend_confirmation_code'
      resources :notifications
      resources :favorie_produits
      resources :notes_vitrines
      resources :followers
      resources :vitrines
      resources :paiements
      resources :transactions do
        collection do
          get :user_transactions
        end
      end
      resources :calls do
        collection do
          get :user_calls
        end
      end
      resources :messages
      resources :participants
      resources :conversations
      resources :produits
      resources :sub_categorie_produits
      resources :categorie_produits
    end
  end
end
