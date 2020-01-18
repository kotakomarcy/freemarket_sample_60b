Rails.application.routes.draw do
  
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :signup do
    collection do
      get 'index'
    end
  end

  devise_scope :user do
    get 'users/signup/registration', to: 'users/registrations#new'
    get 'users/signup/phone_num', to: 'users/registrations#new_phone'
    get 'addresses', to: 'users/registrations#new_address'
    get 'payments', to: 'users/registrations#new_payment'
    get 'done', to: 'users/registrations#done'
  end

  root "products#index"
end
