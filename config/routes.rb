Rails.application.routes.draw do
  root "home#index"

  devise_for :users

  namespace :admin do
    get "/" => "home#index"
  end
end
