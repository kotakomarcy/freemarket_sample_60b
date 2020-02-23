Rails.application.routes.draw do
  
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :signup, only:[:index] do
    collection do
      get 'index'
    end
  end

  devise_scope :user do
    get 'users/signup/registration', to: 'users/registrations#new'
    post 'users/signup/registration', to: 'users/registrations#new'
    get 'users/signup/phone_num', to: 'users/registrations#new_phone'
    post 'users/signup/phone_num', to: 'users/registrations#new_phone'
    get 'users/signup/addresses', to: 'users/registrations#new_address'
    post 'users/signup/addresses', to: 'users/registrations#new_address'
    get 'users/signup/payments', to: 'users/registrations#new_payment'
    post 'users/signup/payments', to: 'users/registrations#new_payment'
    get 'users/signup/done', to: 'users/registrations#done'
    post 'users/signup/done', to: 'users/registrations#done'
  end

  root "products#index"
  resources :products
  resources :logouts, only: [:index]
  resources :mypages,only: [:index] do
    collection do
      get '/mypage/identification', to: 'mypages#identification'
      get '/mypage/profile', to: 'mypages#profile'
      get '/mypage/card', to: 'mypages#card'
      get '/mypage/card/new', to: 'mypages#card_new'
    end
  end
  resources :payments, only: [:new, :show] do
    collection do
      post 'show', to: 'payments#show'
      post 'new', to: 'payments#new'
      post 'pay', to: 'payments#pay'
      delete 'delete', to: 'payments#delete'
    end
  end
end
