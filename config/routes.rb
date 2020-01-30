Rails.application.routes.draw do
  devise_for :users
  as :user do
    get 'login', to: 'devise/sessions#new'
  end


  root "home#index"
end
