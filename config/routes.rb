Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'login', to: 'devise/sessions#new'
  end


  root "home#index"

  resources :admin, only: :index
  namespace :admin do
    resources :media do
      member do
        delete :delete_image_attachment
      end
    end
  end
end
