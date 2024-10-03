Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'api/v1/users/registrations',
    sessions: 'api/v1/users/sessions'
  }
  namespace :api do
    namespace :v1 do
      post 'resend_confirmation_code', to: 'api/v1/users#resend_confirmation_code'
    end
  end
end
