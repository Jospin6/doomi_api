Rails.application.routes.draw do
  resources :reservations
  resources :recherche_produits
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
      get 'user_coordonne', to: 'compte_info#user_coordonne'
      resources :notifications do
        collection do
          get :user_notifications
        end
      end 
      resources :favorie_produits do
        collection do
          get :user_favories
        end
      end
      resources :notes_vitrines
      resources :followers do
        collection do
          get :user_followers
        end
      end
      resources :vitrines do
        collection do
          get :user_vitrine
        end
      end
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
      resources :messages do
        collection do
          get :conversation_messages
        end
      end
      resources :conversations do
        collection do 
          get :user_conversations
        end
      end
      resources :produits do
        collection do 
          get :user_produits
        end
      end
      resources :sub_categorie_produits
      resources :categorie_produits do
        collection do 
          get :all_categories_produits
          get :all_category_produits
        end
      end
    end
  end
end
