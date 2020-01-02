Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    collection do
      post "/login", to: "users#login"
    end
  end

  resources :videos do
    collection do
      get "/view_count_update/:id", to: "videos#view_count_update"
      get "/search", to: "videos#video_search"
    end
  end
end
