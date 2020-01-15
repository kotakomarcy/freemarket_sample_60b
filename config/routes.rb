Rails.application.routes.draw do
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :signup do
    collection do
      get 'index'
    end
  end

  root "products#index"
end
