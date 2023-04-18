Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :users do
    resources :foods, :recipes do
      resources :recipe_foods
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "recipes#index"
end
