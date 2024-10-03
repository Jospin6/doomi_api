Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
      }

      post 'resend_confirmation_code', to: 'api/v1/users#resend_confirmation_code'
    end
  end
end
