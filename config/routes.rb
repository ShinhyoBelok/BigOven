Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  get "/recipes/:id/shopping_list", to: "foods#shopping_list"
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
