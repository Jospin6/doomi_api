Rails.application.routes.draw do
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
