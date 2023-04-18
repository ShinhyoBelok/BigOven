Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  get "/shoping_list", to: "foods#shoping_list"
  post "/recipes/:id", to: "recipes#toggle"
  get "/public_recipes", to: "recipes#public"
  get "/author", to: "recipes#show_author"
  resources :users
  resources :foods
  resources :recipes
  resources :recipe_foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "recipes#index"
end
