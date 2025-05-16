Rails.application.routes.draw do
  resources :parks
  root "parks#index"
  devise_for :users, controllers: { registrations: "users/registrations" }
end
