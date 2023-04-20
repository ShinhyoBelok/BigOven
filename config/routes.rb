Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  get "/shoping_list", to: "foods#shoping_list"
  post "/recipes/:id", to: "recipes#toggle"
  get "/public_recipes", to: "recipes#public"

  resources :users
  resources :foods
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "recipes#index"
end
