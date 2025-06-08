Rails.application.routes.draw do
  resources :parks
  root "parks#index"
  resources :parks do
    resources :comments, only: [ :create ]
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
end
