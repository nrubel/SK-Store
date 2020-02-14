Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'login', to: 'devise/sessions#new'
  end


  root "home#index"
  resources :shop, only: [:index, :show]

  resources :admin, only: :index
  namespace :admin do
    resources :media do
      member do
        delete :delete_image_attachment
      end
    end
    resources :users
    resources :settings, only: :index
    namespace :settings do
      resources :brand do
        member do
          delete :delete_image_attachment
        end
      end
      resources :navigation, only: [:create, :update, :destroy]
      resources :menu, only: [:new, :edit, :create, :update, :destroy]
    end
    resources :products
    resources :categories
    resources :attribute
  end
end
