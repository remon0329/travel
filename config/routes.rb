Rails.application.routes.draw do
  resources :parks
  root "parks#index"
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
end
