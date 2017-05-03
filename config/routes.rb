Rails.application.routes.draw do
  devise_for :patients
  devise_for :medical_doctors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api' do
    resources :medical_doctors, only: %i(inex show)
    resources :patients, only: %i(index show) do
      post '/signup'
      post '/signin'
    end
    resources :payments, only: %i(index show create) do
      member do
        put :approve
        put :decline
        put :cancel
      end
    end
  end
end
