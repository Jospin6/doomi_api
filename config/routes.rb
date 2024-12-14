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
      get 'current_user', to: 'users#show'
      resources :services_disponible_hotels
      resources :evaluations
      resources :coordonnes do
        collection do
          get :user_coordonne
        end
      end 
      resources :hotellerie_services
      resources :menus
      resources :projets
      resources :restaurations
      resources :reservations
      resources :recherche_produits
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
          post :add_recommandation
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
          post :add_recommandation
        end
      end
      resources :sub_categorie_produits
      resources :categorie_produits
    end
  end
end
